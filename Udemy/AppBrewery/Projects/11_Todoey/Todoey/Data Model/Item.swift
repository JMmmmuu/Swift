//
//  Item.swift
//  Todoey
//
//  Created by Yuseok on 23/08/2019.
//  Copyright © 2019 Yuseok. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: TimeInterval = 0
    @objc dynamic var colorCode: String = ""
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
}
