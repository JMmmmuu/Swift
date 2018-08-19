//
//  Todo.swift
//  Todos
//
//  Created by Yuseok on 2018. 8. 16..
//  Copyright © 2018년 Yuseok. All rights reserved.
//

import Foundation
import UserNotifications

/// Struct to represent Todo instance
struct Todo: Codable {
    var title: String           // 작업 이름
    var due: Date               // 작업 기한
    var memo: String?           // 작업 메모
    var shouldNotify: Bool      // 사용자가 기한에 맞춰 알림을 받기 원하는지
    var id: String              // 작업 고유 ID
}

/// Todo 목록 저장/로드
extension Todo {
    
    static var all: [Todo] = Todo.loadTodosFromJSONFile()
    
    /// Todo JSON 파일 위치
    private static var todosPathURL: URL {
        return try! FileManager.default.url(for: FileManager.SearchPathDirectory.applicationSupportDirectory,
                                            in: FileManager.SearchPathDomainMask.userDomainMask,
                                            appropriateFor: nil,
                                            create: true).appendingPathComponent("todos.json")
    }
    
    /// JSON 파일로부터 Todo 배열 읽어오기
    private static func loadTodosFromJSONFile() -> [Todo] {
        do {
            let jsonData: Data = try Data(contentsOf: self.todosPathURL)
            let todos: [Todo] = try JSONDecoder().decode([Todo].self, from: jsonData)
            return todos
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    /// 현재 Todo 배열 상태를 JSON 파일로 저장
    @discardableResult private static func saveToJSONFile() -> Bool {
        do {
            let data: Data = try JSONEncoder().encode(self.all)
            try data.write(to: self.todosPathURL, options: Data.WritingOptions.atomicWrite)
            return true
        } catch {
            print(error.localizedDescription)
        }
        return false
    }
}

/// 현재 Todo 배열에 추가/삭제/수정
extension Todo{
    
    @discardableResult static func remove(id: String) -> Bool {
        
        guard let index: Int = self.all.index(where: { (todo: Todo) -> Bool in todo.id == id })
            else { return false }
        self.all.remove(at: index)
        return self.saveToJSONFile()
    }
    
    @discardableResult func save(completion: () -> Void) -> Bool {
    
        if let index = Todo.index(of: self) {
            Todo.removeNotification(todo: self)
            Todo.all.replaceSubrange(index...index, with: [self])
        } else {
            Todo.all.append(self)
        }
        
        let isSuccess: Bool = Todo.saveToJSONFile()
        
        if isSuccess {
            if self.shouldNotify {
                Todo.addNotification(todo: self)
            } else {
                Todo.removeNotification(todo: self)
            }
            completion()
        }
        
        return isSuccess
    }
    
    private static func index(of target: Todo) -> Int? {
        guard let index: Int = self.all.index(where: { (todo: Todo) -> Bool in todo.id == target.id })
            else { return nil }
        
        return index
    }
}

/// Todo의 User Notification 관련 메서드
extension Todo {
    private static func addNotification(todo: Todo) {
        // 공용 UserNotification 객체
        let center: UNUserNotificationCenter = UNUserNotificationCenter.current()
        
        // Notificatino contents 객체 생성
        let content = UNMutableNotificationContent()
        content.title = "할일 알람"
        content.body = todo.title
        content.sound = UNNotificationSound.default()
        content.badge = 1
        
        // 기한 날짜 생성
        let dateInfo = Calendar.current.dateComponents([Calendar.Component.year, Calendar.Component.day, Calendar.Component.hour, Calendar.Component.minute], from: todo.due)
        
        // Notification 트리거 생성
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: false)
        
        // Notification 요청 객체 생성
        let request = UNNotificationRequest(identifier: todo.id, content: content, trigger: trigger)
        
        // Notification 스케쥴 추가
        center.add(request, withCompletionHandler: { (error : Error?) in
            if let theError = error {
                print(theError.localizedDescription)
            }
        })
    }
    
    private static func removeNotification(todo: Todo) {
        let center: UNUserNotificationCenter = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: [todo.id])
    }
}
