//
//  TodoViewController.swift
//  Todos
//
//  Created by Yuseok on 2018. 8. 16..
//  Copyright © 2018년 Yuseok. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController {

    // MARK:- Nested Types
    /// 동일한 화면을 편집상태와 보기 모드로 변환
    private enum Mode {
        case edit, view
    }
    
    // MARK:- Properties
    // MARK: Type Properties
    /// 스토리보드에 구현해 둔 인스턴스를 코드를 통해 더 생성하기 위하여 스토리보드 ID를 활용
    static let storyboardID: String = "TodoViewController"
    
    // MARK: Stored Properties
    /// 화면에 보여줄 Todo 정보
    var todo: Todo?
    
    // MARK: Privates
    /// 현재 화면의 작업 상태
    private var mode: Mode = Mode.edit {
        // mode 변경에 따라 적절한 처리
        didSet {
            self.titleField.isUserInteractionEnabled = (mode == .edit)
            self.memoTextView.isEditable = (mode == .edit)
            self.dueDatePicker.isUserInteractionEnabled = (mode == .edit)
            self.shouldNotifySwitch.isEnabled = (mode == .edit)
            
            if mode == Mode.edit {
                if todo == nil {
                    self.navigationItem.leftBarButtonItems = [self.cancelButton]
                } else {
                    self.navigationItem.rightBarButtonItems = [self.doneButton, self.cancelButton]
                }
            } else {
                self.navigationItem.rightBarButtonItems = [self.editButton]
            }
        }
    }
    
    /// 수정 - 네비게이션 바 버튼
    private var editButton: UIBarButtonItem {
        let button: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.edit,
                                                      target: self,
                                                      action: #selector(touchUpEditButton(_:)))
        return button
    }
    
    /// 취소 - 네비게이션 바 버튼
    private var cancelButton: UIBarButtonItem {
        let button: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel,
                                                      target: self,
                                                      action: #selector(touchUpCancelButton(_:)))
        return button
    }
 
    /// 완료 - 네비게이션 바 버튼
    private var doneButton: UIBarButtonItem {
        let button: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done,
                                                      target: self,
                                                      action: #selector(touchUpDoneButton(_:)))
        return button
    }
    
    // MARK: IBOutlets
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var memoTextView: UITextView!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var shouldNotifySwitch: UISwitch!
    
    // MARK:- Methods
    // MARK: Privates
    /// 화면 초기화
    private func initializeViews() {
        
        // 이전 화면에서 전달받은 todo가 있다면 그에 맞게 화면 초기화
        if let todo: Todo = self.todo {
            self.navigationItem.title = todo.title
            self.titleField.text = todo.title
            self.memoTextView.text = todo.memo
            self.dueDatePicker.date = todo.due
            self.mode = Mode.view
        }
    }
    
    /// 간단한 얼럿을 보여줄 때 코드 중복을 줄이기 위한 메서드
    private func showSimpleAlert(message: String, cancelTitle: String = "확인",
                                 cancelHandler: ((UIAlertAction) -> Void)? = nil) {
        
        let alert: UIAlertController = UIAlertController(title: "알림",
                                                         message: message,
                                                         preferredStyle: UIAlertControllerStyle.alert)
        let action: UIAlertAction = UIAlertAction(title: cancelTitle,
                                                  style: UIAlertActionStyle.cancel,
                                                  handler: cancelHandler)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    /// 수정 버튼을 눌렀을 때
    @objc private func touchUpEditButton(_ sender: UIBarButtonItem) {
        self.mode = Mode.edit
    }
    
    /// 취소 버튼을 눌렀을 때
    @objc private func touchUpCancelButton(_ sender: UIBarButtonItem) {
        
        if self.todo == nil {
            // 이전 화면에서 전달받은 todo가 없다면 새로 작성을 위한 상태이므로 모달을 내려주고
            self.navigationController?.presentingViewController?.dismiss(animated: true, completion: nil)
        } else {
            // 그렇지 않으면 다시 원래 todo 상태로 화면을 초기화 해줌
            self.initializeViews()
        }
    }
    
    /// 완료 버튼을 눌렀을 때
    @objc private func touchUpDoneButton(_ sender: UIBarButtonItem) {
        
        // todo 제목은 필수사항이므로 입력했는지 확인
        guard let title: String = self.titleField.text,
            title.isEmpty == false else {
                self.showSimpleAlert(message: "제목은 꼭 작성해야합니다",
                                     cancelHandler: { (action: UIAlertAction) in
                                        self.titleField.becomeFirstResponder()
                })
                return
        }
    
    
        // 새로운 todo 생성
        let todo: Todo
        todo = Todo(title: title,
                    due: self.dueDatePicker.date,
                    memo: self.memoTextView.text,
                    shouldNotify: self.shouldNotifySwitch.isOn,
                    id: self.todo?.id ?? String(Date().timeIntervalSince1970))    /// 유닉스 타임스탬프를 할 일 고유 아이디로 활용
    
        let isSuccess: Bool
    
        if self.todo == nil {
            // 새로 작성하기 위한 상태라면 저장을 완료하고 모달을 내려줌
            isSuccess = todo.save {
                self.navigationController?.presentingViewController?.dismiss(animated: true, completion: nil)
            }
        } else {
            // 수정상태라면 저장을 완료하고 화면을 보기모드로 전환
            isSuccess = todo.save(completion: {
                self.todo = todo
                self.mode = Mode.view
            })
        }
    
        // 저장에 실패하면 알림
        if isSuccess == false {
            self.showSimpleAlert(message: "저장 실패")
        }
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // 텍스트 필드 delegate 설정
        self.titleField.delegate = self
        
        // 이전 화면에서 전달받은 todo가 없다면 새로운 작성화면 설정
        if self.todo == nil {
            self.navigationItem.leftBarButtonItem = self.cancelButton
            self.navigationItem.rightBarButtonItem = self.doneButton
        } else {
            self.navigationItem.rightBarButtonItem = self.editButton
        }
        
        // 화면 초기화
        self.initializeViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 수정 모드라면 텍스트 필드에 바로 입력할 수 있도록 키보드 보여줌
        if self.mode == Mode.edit {
            self.titleField.becomeFirstResponder()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

/// 텍스트 필드 delegate 메서드 구현
extension TodoViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.navigationItem.title = textField.text
    }
}

