//
//  Question.swift
//  DISCTest
//
//  Created by Yuseok on 2018. 8. 10..
//  Copyright © 2018년 Yuseok. All rights reserved.
//

import Foundation
import UIKit

struct Question: Codable {
    let d: String
    let i: String
    let s: String
    let c: String
}

extension Question {
    static var all: [Question] = {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "Questions") else {
            return []
        }
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        do {
            return try jsonDecoder.decode([Question].self, from: dataAsset.data)
        } catch {
            return []
        }
    } ()
}
