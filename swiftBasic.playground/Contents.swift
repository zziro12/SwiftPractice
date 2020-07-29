import UIKit
import Foundation

var str = "Hello, playground"

let random = arc4random_uniform(100)

print("random vlaue = \(random)")

// tuple
let coordinates = (2,3)

let x = coordinates.0
let y = coordinates.1

let coordinateNamed = (x : 7,y : 10 )

let namedX = coordinateNamed.x
let namedY = coordinateNamed.y

//한번에 가져올수있다.
let (x3, y3) = coordinateNamed
x3
y3


// boolean
let yes: Bool = true
let no = false

let result = 3 > 6

if result {
    print("참")
}else {
    print("거짓")
}

//swift에서 else if 는 없는지 알아보기
let value = 10
if ( value > 10){
    print("value > 10")
}else if ( value < 10){
    print("vlaue < 10")
}else{
    print("value = 10")
}
let name = "jack"

let isJack = name == "jack"
let isMale = false

let JackAndMale = isJack && isMale
let JackOrMale = isJack || isMale


//let Msg : String
//if isJack{
//    Msg = "I`m Jack"
//}else{
//    Msg = "I`m not Jack"
//}

let Msg = isJack ? "I`m Jack" : "I`m not Jack"
print("Msg : \(Msg)")

//Scope ?
var hours = 50
let payPerHour = 10000
var salary = 0

//var a = 10
//var b = 2
//a += 10*3

func salaryCalculator(){
    if hours >= 40 {
        let extraHours = hours - 40
        //var extraHours = hours - 40
        salary += extraHours * payPerHour * 2
        hours -= extraHours
    }
    salary += hours * payPerHour
    
    //print(extraHours)
    print(salary)
}
salaryCalculator()
//var,let을 하던 상관없이 { scope : 유효범위 }에 속하기 때문에 extraHours는 출력불가능

//while

//var i = 0
//while i <= 10{
//    print(i)
//    i += 1
//}


//print("repeat")
//i = 0
//repeat{
//    print(i)
//    i += 1
//} while i < 10


//for loop
let closedRange : ClosedRange = 0...10
let harfClosedRange = 0..<10
let range = 1...5
//print(closedRange)
//print(range)


var sum = 0
for i in closedRange{
    print("i => \(i)")
    sum += i
}
print("sum = > \(sum)")

//core grapics float
var sinValue : CGFloat = 0

for i in closedRange{
    sinValue = sin(CGFloat.pi/4 * CGFloat(i))
}

//_의 사용
let testName = "open"
for _ in closedRange{
    print("name >> \(testName)")
}

//for i in closedRange {
//    if i % 2 == 0{
//        print("i >> \(i)")
//    }
//}

//위 로직과 같음
for i in closedRange where i % 2 == 0 {
    print("i is. > \(i)")
}

for i in closedRange {
    if i == 3{
        continue
    }
    print("i >> \(i)")
}

//var num1 = 7
//
//switch num1 {
//case 0...10:
//    print("0부터 10안의 숫자입니다.")
//default:
//    print("나머지 숫자")
//}

var num1 = 7

switch num1 {
case _ where num1 % 2 == 0:
    print("짝수.")
default:
    print("홀수!")
}

let coordinate1 = (x : 10,y : 10)
//switch coordinate1 {
//case (0,0):
//    print("원점")
//case (_,0):
//    print("x축")
//case (0,_):
//    print("y축")
//default:
//    print("좌표안의 값")
//}
switch coordinate1 {
case (0,0):
    print("원점")
case (let x ,0):
    print("x축위에있습니다. x값은 : \(x)")
case (0, let y):
    print("y축위에있습니다. y값은 : \(y)")
case (let x,let y) where x == y:
    print("x,y의 값이 같습니다 \(x),\(y)")
case (let x,let y):
    print("x,y의 값은 \(x),\(y)")
}
