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


    var pickedImage: UIImage? = nil
    var flower: String? = nil {
        willSet {
            parameters["titles"] = newValue
        }
    }
    
    let WIKI_URL = "https://en.wikipedia.org/w/api.php"
    var parameters: [String : String] = [
        "format" : "json",
        "action" : "query",
        "prop" : "extracts",
        "exintro" : "",
        "explaintext" : "",
        "indexpageids" : "",
        "redirects" : "1", ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let img = pickedImage {
            imageView.image = img
            getFlowerInfo(withURL: WIKI_URL, parameters)
        }
    }
    
    var pageID: Int = 0
    
    func getFlowerInfo(withURL url: String, _ params: [String : String]) {
        print(url, params)
        Alamofire.request(url, method: .get, parameters: params).responseJSON {
            response in
            if response.result.isSuccess {
                if let val = response.result.value {
                    print(val)
                    // pageID = Int(val["query"]["pages"][0])
                }
            } else {
                print("Failed")
            }
        }
        
        
    }

}