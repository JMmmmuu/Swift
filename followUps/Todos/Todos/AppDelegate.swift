//
//  AppDelegate.swift
//  Todos
//
//  Created by Yuseok on 2018. 8. 16..
//  Copyright © 2018년 Yuseok. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // 애플리케이션 실행 직후 호출
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // User Notification Center를 통해서 노티피케이션 권한 획득
        let center: UNUserNotificationCenter = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [UNAuthorizationOptions.alert, UNAuthorizationOptions.sound, UNAuthorizationOptions.badge]) { (granted, error) in
            print("허용여부\(granted), 오류: \(error?.localizedDescription ?? "없음")")
        }
        
        // 맨 처음 화면의 뷰 컨트롤러(TodosTableViewController)를 UserNotificationCenter의 delegate로 설정
        if let navigationController: UINavigationController = self.window?.rootViewController as? UINavigationController, let todosTableViewController: TodosTableViewController = navigationController.viewControllers.first as? TodosTableViewController {
            
            UNUserNotificationCenter.current().delegate = todosTableViewController
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

