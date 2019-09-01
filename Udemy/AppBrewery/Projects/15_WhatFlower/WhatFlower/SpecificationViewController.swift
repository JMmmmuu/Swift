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
import SDWebImage

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
        "prop" : "extracts|pageimages",
        "exintro" : "",
        "explaintext" : "",
        "indexpageids" : "",
        "redirects" : "1",
        "pithumbsize" : "500"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let img = pickedImage {
            //imageView.image = img
            getFlowerInfo(withURL: WIKI_URL, parameters)
        }
    }
    
    
    func getFlowerInfo(withURL url: String, _ params: [String : String]) {
        print(url, params)
        Alamofire.request(url, method: .get, parameters: params).responseJSON {
            response in
            if response.result.isSuccess {
                
                let infoJSON = JSON(response.result.value!)
                guard let pageID = infoJSON["query"]["pageids"][0].string else {
                    fatalError()
                }
                print(infoJSON["query"]["pages"][pageID]["extract"])
                let flowerImageURL = infoJSON["query"]["pages"][pageID]["thumbnail"]["source"].stringValue
                
                self.imageView.sd_setImage(with: URL(string: flowerImageURL))
                self.textView.text = infoJSON["query"]["pages"][pageID]["extract"].string
                self.navigationItem.title = self.flower

            } else {
                print("Failed")
            }
        }
    }
}
