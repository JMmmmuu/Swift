//
//  AnimalInfo.swift
//  CompanionAnimals
//
//  Created by Yuseok on 2018. 7. 20..
//  Copyright © 2018년 Yuseok. All rights reserved.
//

import UIKit

struct AnimalInfo: Codable {
    let name: String
    let animalDescription: String
    var imageName: String
    
    static func decode(from assetName: String) -> AnimalInfo? {
        guard let asset: NSDataAsset = NSDataAsset(name: assetName) else {
            print("fail asset load")
            return nil
        }
        
        do {
            let decoder: PropertyListDecoder = PropertyListDecoder()
            return try decoder.decode(AnimalInfo.self, from: asset.data)
        } catch {
            print("fail data decoding")
            print(error.localizedDescription)
            return nil
        }
    }
}
