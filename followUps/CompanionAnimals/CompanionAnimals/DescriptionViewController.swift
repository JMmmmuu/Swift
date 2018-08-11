//
//  DescriptionViewController.swift
//  CompanionAnimals
//
//  Created by Yuseok on 2018. 7. 20..
//  Copyright © 2018년 Yuseok. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    // MARK:- Properties
    var animalInfo: AnimalInfo!
    
    // MARK: IBOutlets
    @IBOutlet var animalImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionTextView: UITextView!

    // MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = self.animalInfo.name
        self.animalImageView.image = UIImage(named: self.animalInfo.imageName)
        self.nameLabel.text = self.animalInfo.name
        self.descriptionTextView.text = self.animalInfo.animalDescription
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
