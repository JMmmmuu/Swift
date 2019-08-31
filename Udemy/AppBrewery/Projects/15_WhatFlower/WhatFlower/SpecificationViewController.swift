//
//  SpecificationViewController.swift
//  WhatFlower
//
//  Created by Yuseok on 31/08/2019.
//  Copyright © 2019 Yuseok. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SpecificationViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!

    var WIKI_URL = "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro=&explaintext=&titles="
    var pickedImage: UIImage? = nil
    var flower: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let img = pickedImage {
            imageView.image = img
            WIKI_URL += flower!.replacingOccurrences(of: " ", with: "")
        }
        
        getFlowerInfo()
    }
    
    
    func getFlowerInfo() {
        print("HIHI")
        Alamofire.request(WIKI_URL, method: .get).responseJSON {
            response in
            if response.result.isSuccess {
                print(response.result.value!)
            } else {
                print("Failed")
            }
        }
        
        
    }

}
