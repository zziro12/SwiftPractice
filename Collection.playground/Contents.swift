import UIKit

//Collection
//Array, Dictionary, Set, Closure

var evenNumbers : [Int] = [2,4,6]
//let evenNumbers : Array[Int] = [2,4,6]

evenNumbers.append(10)
print(evenNumbers)
evenNumbers += [12,14]
print(evenNumbers)
evenNumbers.append(contentsOf: [18, 20])
print(evenNumbers)

//evenNumbers = []
let isEmpty = evenNumbers.isEmpty
let count = evenNumbers.count
print(evenNumbers.first)

//evenNumbers = []
let firstItem = evenNumbers.first
print(evenNumbers.last)

//evenNumbers = []
if let firstElement = evenNumbers.first {
    print(firstElement)
}else{
    print("Array is Empty")
}

evenNumbers.min()
evenNumbers.max()

evenNumbers.contains(10)

// -----
//let firstThree = evenNumbers[0...2]

evenNumbers.insert(0, at: 0)
evenNumbers

//evenNumbers.removeAll()
//evenNumbers =[]
evenNumbers.remove(at: 0)

// update
//evenNumbers[0] = -2
evenNumbers[0...2] = [-2,0,2]
evenNumbers

//swap
//evenNumbers.swapAt(1, 5)
//evenNumbers

//for num in evenNumbers{
//    print(num)
//}

for (index, num) in evenNumbers.enumerated(){
    print(index, num)
}

let firstThreeRemoved = evenNumbers.dropFirst(3)
firstThreeRemoved

let lastThreeRemoved = evenNumbers.dropLast(3)
lastThreeRemoved

let firstThree = evenNumbers.prefix(3)
let lastThree = evenNumbers.suffix(3)
evenNumbers

//많이 쓰이는것 .isEmpty, .count,
