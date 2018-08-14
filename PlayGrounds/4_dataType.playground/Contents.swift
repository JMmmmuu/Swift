//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str)

var j: Int = 0
for i in 0...3 {
    j += i
}
print(j)

let boolean:Bool = true
print("\(boolean)")

let unicodeScalarValue: String = "\u{2665}"
print(unicodeScalarValue)

var what: Bool = false
let hello:String = "Hello"
what = hello.hasPrefix("He")
print(what)

/*************************
 ******** Tuple **********
 *************************/
typealias  myTuple = (name: String, age: Int, Height: Float, Weight: Float)
let yuSeok: myTuple = ("Yuseok", 22, 171.5, 65.3)

print(yuSeok)
print()
dump(yuSeok)
print("name is \(yuSeok.name), age is \(yuSeok.age), Height is \(yuSeok.Height), Weight is \(yuSeok.Weight)")

/*************************
 ******** Array **********
 *************************/
var names: Array<String> = ["Yuseok", "Minjin", "Jiho", "Yagom"]
// var names: [String] = ["Yuseok", "Minjin", "Jiho", "Yagom"]
var emptyArray: [Any] = []
print(names[1])
// print(names.first)// + " " + names.last)
names.append("Elsa")
print(names)
names.insert("Second", at: 2)
print(names)


/*************************
 ****** Dictionary *******
 *************************/
typealias myDictionary = [String: Int]
var emptyDic: [String: Int] = [:]
var numberForName: myDictionary = myDictionary()
numberForName = ["Yuseok": 1, "Minjin": 2, "Jiho": 3, "Yagom": 4]
print(numberForName)
print(numberForName["Yuseok"])
print("key value Yuseok correnspond to \(numberForName["Yuseok"])")

/*************************
 ********* Set ***********
 *************************/
print("Hi Swift, this is Yuseok!")

