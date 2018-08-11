//
//  MakerViewController.swift
//  CompanionAnimals
//
//  Created by Yuseok on 2018. 7. 20..
//  Copyright © 2018년 Yuseok. All rights reserved.
//

import UIKit

class MakerViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet var descriptionTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.descriptionTextView.text = """
        Hi, This is Yuseok!
        Thank you for downloading my Application
        My instagram link is http://www.instagram.com/JMmmmuu
        Feel free to follow me!
        """
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:- Methods
    @IBAction func touchUpInsideDismissButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
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
