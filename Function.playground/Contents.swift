import UIKit

func printName(){
    print("My name is Jinho~")
}
printName()

//input parameter
func multipleOfTen(number: Int){
    print("\(number)에 10을 곱한 결과는 >> \(number * 10)")
}
multipleOfTen(number: 10)

//param 2
//물건값과 갯수 받아서 금액 출력하는 함수
//func printTotalPrice(productPrice : Int, count : Int){
//    print("TotalPrice is \(productPrice * count)")
//}
//printTotalPrice(productPrice: 500, count: 3)

//use underscore
//func printTotalPrice(_ productPrice : Int, _ count : Int){
//    print("TotalPrice is \(productPrice * count)")
//}
//printTotalPrice(1000, 5)

//참고로 swift는 유니코드를 지원하기 때문에 이러한 코드도 사용가능
//func printTotalPrice(상품가격 productPrice : Int, 상품갯수 count : Int){
//    print("TotalPrice is \(productPrice * count)")
//}
//printTotalPrice(상품가격 : 300,상품갯수 : 10)

func printTotalPrice(productPrice : Int, count : Int){
    print("TotalPrice is \(productPrice * count)")
}

printTotalPrice(productPrice: 500, count: 3)
//printTotalPrice(productPrice: 500, count: 10)
//printTotalPrice(productPrice: 500, count: 5)
//printTotalPrice(productPrice: 500, count: 1)

//productPrice는 고정이고 count값만 바뀌게 될경우 productPrice에 default 값을 넣어 줄 수 있다.
func printTotalPriceWithDefault(productPrice : Int = 1000, count : Int){
    print("TotalPrice is \(productPrice * count)")
}
printTotalPriceWithDefault(count: 10)
printTotalPriceWithDefault(count: 5)
printTotalPriceWithDefault(count: 1)
//productPrice 값을 지정할수도 있다.
printTotalPriceWithDefault(productPrice : 2000, count: 5)

//func 함수이름 (인자 : 타입) -> 반환타입{}
func totalPrice(productPrice : Int, count : Int) -> Int{
    let result = productPrice * count
    return result
}
totalPrice(productPrice: 300, count: 3)
print(totalPrice(productPrice: 300, count: 3))
let funcresult = totalPrice(productPrice: 300, count: 3)
print(funcresult)

// 1. 성, 이름 받아서 fullname 출력함수
func printFullName(firstName : String, lastName : String ){
    print("이름은 \(firstName + " " + lastName)입니다.")
}
printFullName(firstName: "Hong", lastName: "gildong")
// 2. 1번에서 만든 함수인데, 파라미터 이름을 제거하고 fullname 출력하는 함수 만들기
func printFullNameUnderScore(_ firstName : String, _ lastName : String ){
    print("이름은 \(firstName + " " + lastName)입니다.")
}
printFullNameUnderScore( "Choi", "jinho")

// 3. 성, 이름을 받아서 fullname return 하는 함수만들기
func printFullNameReturn(firstName : String, lastName : String ) -> String{
    return "\(firstName)  \(lastName)"
}
let funcResult = printFullNameReturn(firstName: "Hi", lastName: "Siri")
print(funcResult)

//In-out Parameter

var value = 3
func incrementAndPrint( _ value : inout Int){
    value += 1
    print(value)
}
incrementAndPrint(&value)

// ---- function as a param
func add(_ a : Int , _ b : Int)-> Int {
    return a + b
}
func subtract(_ a : Int , _ b : Int)-> Int {
    return a - b
}
var function = add
function(3,3)

func printResult(_ function : (Int,Int) -> Int,_ a : Int , _ b : Int){
    let result = function(a,b)
    print(result)
}
printResult(subtract, 5, 4)
