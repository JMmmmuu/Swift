//
//  Category.swift
//  Todoey
//
//  Created by Yuseok on 23/08/2019.
//  Copyright © 2019 Yuseok. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var colorCode: String = ""
    let items = List<Item>()

}

