//
//  LoginViewController.swift
//  LoginFlow
//
//  Created by Yuseok on 2018. 7. 22..
//  Copyright © 2018년 Yuseok. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    // MARK:- Properties
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    // MARK:- Methods
    // MARK: IBActions
    @IBAction func touchUpLoginButton(_ sender: UIButton) {
        
        guard let email: String = self.emailField.text,
            email.isEmpty == false else {
                self.showAlert(message: "이메일을 입력해주세요", control: self.emailField)
                return
        }
        
        guard let password: String = self.passwordField.text,
            password.isEmpty == false else {
                self.showAlert(message: "패스워드를 입력해주세요", control: self.passwordField)
                return
        }
        
        self.performSegue(withIdentifier: "ShowInfo", sender: sender)
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "로그인"
        
        print("LoginViewController 객체의 뷰가 메모리에 로드됨")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        print("LoginViewController 객체의 뷰가 나타날 예정")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("LoginViewController 객체의 뷰가 나타남")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("LoginViewController 객체의 뷰가 사라질 예정")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("LoginViewController 객체의 뷰가 사라짐")
    }
    
    // MARK: Privates
    private func showAlert(message: String, control toBeFirstResponder: UIControl?) {
        let alert: UIAlertController = UIAlertController(title: "알림",
                                                         message: message,
                                                         preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: "입력하기",
                                                    style: UIAlertActionStyle.default) { [weak toBeFirstResponder] (action: UIAlertAction) in
                                                        toBeFirstResponder?.becomeFirstResponder()
        }
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "취소",
                                                        style: UIAlertActionStyle.cancel,
                                                        handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true) {
            print("얼럿 화면에 보여짐")
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        guard let email: String = self.emailField.text,
            let password: String = self.passwordField.text else {
                return
        }
        
        guard let id: String = segue.identifier else { return }
        guard id == "ShowInfo" else { return }
        
        guard let infoViewController = segue.destination as? InfoViewController else {
            return
        }
        
        infoViewController.loginInfo = LoginInfo(email: email, password: password)
    }
}
