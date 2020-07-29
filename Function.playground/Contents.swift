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
