//
//  QuestionViewController.swift
//  DISCTest
//
//  Created by Yuseok on 2018. 8. 10..
//  Copyright © 2018년 Yuseok. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    /// 인터페이스 빌더에서 설정한 버튼의 tag
    enum ButtonTag: Int {
        case d = 101
        case i, s, c
    }
    
    // MARK:- Properties
    var questionIndex: Int!
    
    @IBOutlet weak var backButton: UIButton!
    
    // MARK:- Methods
    // MARK: Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.questionIndex = self.questionIndex ?? 0
        
        if self.questionIndex < 1 {
            self.backButton.isHidden = true
        }
        
        let question: Question = Question.all[questionIndex]
        
        guard let dButton: UIButton = self.view.viewWithTag(ButtonTag.d.rawValue) as? UIButton else { return }
        dButton.setTitle(question.d, for: UIControlState.normal)
        
        guard let iButton: UIButton = self.view.viewWithTag(ButtonTag.i.rawValue) as? UIButton else { return }
        iButton.setTitle(question.i, for: UIControlState.normal)
        
        guard let sButton: UIButton = self.view.viewWithTag(ButtonTag.s.rawValue) as? UIButton else { return }
        sButton.setTitle(question.s, for: UIControlState.normal)
        
        guard let cButton: UIButton = self.view.viewWithTag(ButtonTag.c.rawValue) as? UIButton else { return }
        cButton.setTitle(question.c, for: UIControlState.normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: IBActions
    @IBAction func touchUpBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func touchUpAnswerButton(_ sender: UIButton) {
        
        guard let tag: ButtonTag = ButtonTag(rawValue: sender.tag) else {
            return
        }
        
        switch tag {
        case .d:
            UserInfo.shared.score.d += 1
        case .i:
            UserInfo.shared.score.i += 1
        case .s:
            UserInfo.shared.score.s += 1
        case .c:
            UserInfo.shared.score.c += 1
        }
        
        let nextIndex: Int = self.questionIndex + 1
        
        if Question.all.count > nextIndex,
            let nextViewController: QuestionViewController = self.storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController {
            nextViewController.questionIndex = nextIndex
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            self.performSegue(withIdentifier: "ShowResult", sender: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
