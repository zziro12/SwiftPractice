import UIKit

//Optional
var carName: String?
var dogName: String? = "mango"

//아주 간단한 과제
//최애 영화배우의 이름을 담는 변수 작성 (타입 String?)
// let num = Int("10")
var acterName: String? = "leo"
//변환이 가능해서 int형이 된다면 int형이지만 변환이 불가능한경우 10하이하이 는 nil값이 들어가기 때문에 int? 타입이된다.
let num = Int("10")               //타입 Int?
let numm = Int("10하이하이")        //타입 Int?

print(acterName)//Optional("leo") 옵셔널을 wrap  값이 들어있을지 없을지 모르기때문에



//고급기능 4가지
//Forced unwrapping         > 억지로 박스를 까는거
//Optional binding(if let)  > 부드럽게 박스를 깐다 1탄
//Optional binding(guard)   > 부드럽게 박스를 깐다 2탄
//Nil coalescing            > 박스를 까봤더니 , 값이없으면 디폴트 값을 줘보자



print(dogName)
print(dogName!)
//dogName = nil
//print(dogName!)     error

//dogName = nil
if let unwrappedDogName = dogName {
    print(unwrappedDogName)
}else{
    print("dog name 없다")
}

//func printParsedInt(from:String){
//    if let parsedInt = Int(from){
//        print(parsedInt)
//    }else{
//        print("int로 컨버팅 안됨")
//    }
//}

//let parsedInt = Int(from) >> unwrapped 될수 있는 value가 있냐
//벨류를 추출하기전 보호막을 치는거임
func printParsedInt(from:String){
    guard let parsedInt = Int(from) else{
        print("int로 컨버팅 안됨")
        return
    }
    print(parsedInt)
}


//---Nil coalescing
//myDogName String인데 dogName String?이자나 dogName이 nil이면 ?? 뒤에 > "default dogName value" 를 넣어주라
let myDogName : String = dogName ?? "default dogName value"

// 도전과제
// 1. 최애 음식이름을 담는 변수를 작성 (String?)
var bestFood : String? = "apple"
// 2. 옵셔널 바인딩을 이용해서 값 확인
//if let
if let Food = bestFood{
    print(Food)
}else{
    print("좋아하는 음식이 뭐냐구")
}
//guard let
//guard let Food = bestFood else{
//    print("좋아하는 음식이 뭐냐구")
//    return
//    }
//    print(Food)
//}
// 3. 닉네임 받아서 출력하는 함수 만들기, 조건입력 파라미터는 String?
func printNickName( _ nickName : String?){
    if let name = nickName{
        print(name)
    }else{
        print("닉네임이 뭐냐구")
    }
}

func printNickName222( _ nickName : String?){
    guard let name = nickName else{
        print("닉네임이 뭐냐구")
        return
    }
     print(name)
}

printNickName("man")
printNickName(nil)
printNickName222("mannnn")
printNickName222(nil)
