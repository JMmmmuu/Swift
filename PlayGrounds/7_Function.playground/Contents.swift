//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/**********************************
 ************ Function ************
 *********************************/
// support override, overload

func hello(name: String) -> String {
    return "Hello \(name)!"
}

let helloJenny: String = hello(name: "Jenny")
print(helloJenny)

// 가변 매개변수
func sayHelloToFriends(me: String, friends names: String...) -> String {
    var result: String = ""
    
    for friends in names {
        result += "Hello \(friends)! " + ""
    }
    
    result += "I'm " + me + "!"
    return result
}

print(sayHelloToFriends(me: "Yuseok", friends: "Minjin", "Jiho", "Namgyu"))

print(sayHelloToFriends(me: "Yuseok"))

// reference
var numbers: [Int] = [1, 2, 3]

func nonReferenceParameter(_ arr: [Int]) {
    var copiedArr: [Int] = arr
    copiedArr[1] = 1
}

func referenceParameter(_ arr: inout [Int]) {
    arr[1] = 1
}

nonReferenceParameter(numbers)
print(numbers[1])

referenceParameter(&numbers)
print(numbers[1])

// First-class Citizen
typealias CalculateTwoInts = (Int, Int) -> Int

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: CalculateTwoInts = addTwoInts
// var mathFunction: (Int, Int) -> Int = addTwoInts

print(mathFunction(2, 5))

mathFunction = multiplyTwoInts
// mathFunction: (Int, Int) -> Int = multiplayTwoInts
print(mathFunction(2, 5))

func printMathResult(_ mathFunction: CalculateTwoInts, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 3, 5)
printMathResult(multiplyTwoInts, 3, 5)

// 중첩 함수
typealias MoveFunc = (Int) -> Int

"""
func goRight(_ currentPos: Int) -> Int {
    return currentPos + 1
}

func goLeft(_ currentPos: Int) -> Int {
    return currentPos - 1
}

func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
    return shouldGoLeft ? goLeft : goRight
}
"""
func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
    func goRight(_ currentPos: Int) -> Int {
        return currentPos + 1
    }
    
    func goLeft(_ currentPos: Int) -> Int {
        return currentPos - 1
    }
    
    return shouldGoLeft ? goLeft : goRight
}

var position: Int = 3

let moveToZero: MoveFunc = functionForMove(position > 0)
print("Let's go to Origin Point!")

while position != 0 {
    print("\(position)...")
    position = moveToZero(position)
}

print("Arrived!")



