//
//  InfoViewController.swift
//  LoginFlow
//
//  Created by Yuseok on 2018. 7. 22..
//  Copyright © 2018년 Yuseok. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    // MARK:- Properties
    var loginInfo: LoginInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("InfoViewController 객체의 뷰가 메모리에 로드됨")

        // Do any additional setup after loading the view.
        self.navigationItem.title = "로그인 정보"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("InfoViewController 객체의 뷰가 나타날 예정")
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        guard let info = self.loginInfo else {
            return
        }
        print(info)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("InfoViewController 객체의 뷰가 나타남")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("InfoViewController 객체의 뷰가 사라질 예정")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("InfoViewController 객체의 뷰가 사라짐")
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
