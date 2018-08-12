//
//  ResultViewController.swift
//  DISCTest
//
//  Created by Yuseok on 2018. 8. 10..
//  Copyright © 2018년 Yuseok. All rights reserved.
//
import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var percentageLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // MARK:- Methods
    // MARK: Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.nameLabel.text = UserInfo.shared.name
        self.percentageLabel.text = UserInfo.shared.scorePercentageText
        
        guard let result: Result.Info = UserInfo.shared.hightestScoreResult else { return }
        
        self.titleLabel.text = result.title
        self.descriptionTextView.text = result.typeDescription
    }
    
    // MARK: IBActions
    @IBAction func touchUpDismissButton(_ sender: UIButton) {
        self.navigationController?.presentingViewController?.dismiss(animated: true, completion: nil)
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
