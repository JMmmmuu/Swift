//: Playground - noun: a place where people can play

import UIKit

enum School: String {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    case graduate = "대학원"
}

let myHighestEduLevel: School = .high
print("My highest Education Leve is \(myHighestEduLevel.rawValue)")


/*************************
 ******** 연관 값 **********
 *************************/
enum MainDish {
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}

var dinner: MainDish = .chicken(withSauce: true)
dinner = .pasta(taste: "cream")
dinner = .pizza(dough: "Cheeze Crust", topping: "paperoni")
dinner = .rice

/*************************
 ******* operator ********
 *************************/
prefix operator **
prefix func **(value: Int) -> Int {
    return value * value
}
var myThree: Int = 6
print("my Integer is \(myThree), and the squaure of it is \(**myThree)")

prefix func **(value: String) -> String {
    return value + " " + value
}
var myName: String = "Yuseok"
print("my name is \(myName), and the square of it is \(**myName)")


