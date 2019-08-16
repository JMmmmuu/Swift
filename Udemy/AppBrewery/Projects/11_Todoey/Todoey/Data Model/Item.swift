//
//  File.swift
//  Todoey
//
//  Created by Yuseok on 15/08/2019.
//  Copyright © 2019 Yuseok. All rights reserved.
//

import Foundation

class Item: Encodable {
    var title: String = ""
    var done: Bool = false
    
    init(getTitle tit: String) {
        title = tit
    }
}
