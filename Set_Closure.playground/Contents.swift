import UIKit

//Set 중복이 없는 유니크한 아이템들을 관리할때사용 (순서 없음)
var someArr : Array<Int> = [1,2,3,1]
//array와 set 비교
var someSet : Set<Int> = [1 , 2, 3, 1, 2]

someSet.isEmpty
someSet.count
someSet.contains(2)

someSet.insert(5)
someSet

someSet.remove(1)
someSet

//Closure 이름이 없는 메서드 {}코드블록
//-----Closure
//정석
//var multiplyClosure : (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
//    return a * b
//}
//줄인거 1탄
//var multiplyClosure : (Int, Int) -> Int = { a, b in
//    return a * b
//}
//줄인거 최종 $0첫번째인자 $1 두번째인자
var multiplyClosure : (Int, Int) -> Int = { $0 * $1}
let result = multiplyClosure(3,3)


//function이 클로저를 받는예
func operateTwoNum ( a: Int, b : Int, operation : (Int , Int) -> Int ) -> Int {
    let result = operation(a,b)
    return result
}
operateTwoNum(a: 4, b: 2, operation: multiplyClosure)

var addClosure : (Int, Int ) -> Int = { a, b in
    return a + b
}
operateTwoNum(a: 4, b: 2, operation: addClosure)

operateTwoNum(a: 4, b: 2) { a, b in
    return a - b
}

//-----Capturing value

let voidClosure : () -> Void = {
    print("test 문")
}
voidClosure()

//-----Capturing value

var count = 0

let incrementer = {
    count += 1
}
incrementer()
incrementer()
incrementer()
incrementer()

count

//ex
