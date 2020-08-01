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

//Dictionary
var scoreDic: [String : Int] = ["jon" : 80, "jay" : 90]
//var scoreDic : Dictionary<String, Int> = ["jon" : 80, "jay" : 90]

scoreDic["jon"]
scoreDic["jackson"]

if let score = scoreDic["jackson"] {
    score
}else{
    print("score 없음")
}

scoreDic.isEmpty
scoreDic.count

//dictionary update
scoreDic["jon"] = 100

scoreDic
//dictionary add , remove
scoreDic["sim"] = 20
scoreDic
scoreDic["sim"] = nil
scoreDic

for (name, score) in scoreDic {
    print(name,"hi", score)
}

for key in scoreDic.keys {
    print(key)
}

for value in scoreDic.values {
    print(value)
}
//1. 이름, 직업, 도시 딕셔너리 만들기
//var nameJobCity : Dictionary<String, String> = ["name" : "jinho", "job" : "student" , "city" : "seoul"]
var nameJobCity : [String : String] = ["name" : "jinho", "job" : "student" , "city" : "seoul"]
nameJobCity
//2. 도시를 부산으로 업데이트 하기
nameJobCity["city"] = "busan"


//3. 딕셔너리를 받아서 이름과 도시 프린트하는 함수 만들기
func printNameCity(dic: [String : String]){
    if let name = dic["name"], let city = dic["city"] {
         print(name, city)
    }else{
        print("Cannot find ")
    }
   
}
printNameCity(dic: nameJobCity)



