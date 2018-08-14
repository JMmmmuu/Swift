//: Playground - noun: a place where people can play

import UIKit

/**********************************
 ********** Conditional ***********
 *********************************/
// 조건의 값은 항상 Bool 타입이어야 한다.

var first: Int = 43
var second: Int = 56

if (first > second) {
    print("first > second")
} else if (first < second) {
    print("first < second")
} else {
    print("first == second")
}

var myNumber: Int = 487
switch myNumber {
case 0:
    print("My Number is zero")
case 1..<100:
    print("My Number is two digit number")
default:
    print("My Number is sooooo Big!")
}

let stringValue: String = "Yuseok"
switch stringValue {
case "Yagom":
    print("He is Yagom")
case "Minjin":
    print("He is soldier")
case "Yuseok":
    print("This is Meeee!!")
case "Jiho", "Jaehong", "Ikjun":
    print("He is \(stringValue)")
default:
    print("He's nobody")
}

typealias nameAge = (name: String, age: Int)
let tupleValue:nameAge = ("Yuseok", 22)
switch tupleValue {
case ("Yuseok", 22):
    print("Yeaaah it's me!")
case ("Yuseok", _):
    print("Wrong Age")
case (_, 22):
    print("Wrong Name")
default:
    print("Who are you??")
}


/**********************************
 ************** Loop **************
 *********************************/
// for-in
for i in 0...2 {
    print(i)
}

let friends: [String: Int] = ["Yuseok": 22, "Jungchu": 22, "MelodyNa":22]
for tuple in friends {
    print(tuple)
}
for (key, value) in friends {
    print("\(key) : \(value)")
}           // 순서 주목!

// while

print()
var names: [String] = ["Yuseok", "Jungchu", "MelodyNa", "Minjin"]
while names.isEmpty == false {
    print("Good bye \(names.removeFirst())")
}
