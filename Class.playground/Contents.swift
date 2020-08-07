import UIKit

// Object >> structure와 class 형태로 구현가능
// Object = Data(property) + Method
//structure (value type) 복사된다고 생각하면 편함  vs class (Reference Types)참조, 공유된다
//structure stack영역에 생성 - 시스템에서 당장 실행해야 하거나 타이트하게 컨트롤 매니징해야하는경우(효율적이고 빠르다)
//class heap 영역에 생성 - instance 할당 및 제거 (스텍보단 느림)

//RAM 에 stack과 Heap
//클래스는 heap영억에 생성되고 참조하는 변수들은 stack 영억에 생성되어 heap영억에 선언된 클래스를 참조한다.

struct PersonStruct {
    var firstName : String
    var lastName : String
    
    //클래스가 생성될때 초기값을 생성해 줄것이다.
    init(firstName : String, lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    
    var fullName : String {
        return "\(firstName) \(lastName)"
    }
    
    //mutating
    mutating func uppercaseName() {
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}

//struct를 class 로 변경해보기
class PersonClass {
    var firstName : String
    var lastName : String
    
    //클래스가 생성될때 초기값을 생성해 줄것이다.
    init(firstName : String, lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName : String {
        return "\(firstName) \(lastName)"
    }
    
    //mutating은 클래스에서 사용하지않는다
    func uppercaseName() {
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}

var personStr1 = PersonStruct(firstName: "jinho", lastName: "Choi")
var personStr2 = personStr1

var personClass1 = PersonClass(firstName: "jinho", lastName: "Choi")
var personClass2 = personClass1


personStr2.firstName = "woojin"
personStr1.firstName
personStr2.firstName

personClass2.firstName = "woojin"
personClass1.firstName
personClass2.firstName

personClass2 = PersonClass(firstName: "Bob", lastName: "choi")
personClass1.firstName
personClass2.firstName

personClass1 = personClass2
personClass1.firstName
personClass2.firstName

//example
//struct MovieStruct {
//    var movieTitle : String
//    var movieScore : Int
//
//    static var isArt : Bool = true
//}
//MovieStruct.isArt

////var movie1 = MovieStruct(movieTitle: "zootopia", movieScore: 5)
////movie1.movieTitle = "Jango"
////movie1.movieScore = 3
//
//class MovieClass {
//    var movieTitle : String
//    var movieScore : Int
//
//    init(movieTitle : String, movieScore : Int ) {
//        self.movieTitle = movieTitle
//        self.movieScore = movieScore
//    }
//}
//let movie1 = MovieClass(movieTitle: "zootopia", movieScore: 5)
//movie1.movieTitle = "Jango"
//movie1.movieTitle
//movie1.movieScore = 3
//movie1.movieScore

//class halfValue {
//    var repository : Int
//
//    init(repository : Int) {
//        self.repository = repository
//    }
//
//    var x : Int {
//        get {
//            return repository
//        }set{
//            repository = newValue / 2
//        }
//    }
//
//
//}
//
//var test : halfValue = halfValue(repository: 0)
//test.x = 10
//print(test.x) // 결과값 5
//test.x = 20
//print(test.x) // 결과값 10

//struct Person {
//    var firstName : String
//    var lastName : String
//}
//
//var person1 = Person(firstName: "gildong", lastName: "Hong")
//var person2 = Person(firstName: "gildong", lastName: "Hong")


// think todo app class
class Todo {
    var todoList : String
    var todoState : String
    
    init(todoList : String, todoState : String) {
        self.todoList = todoList
        self.todoState = todoState
    }
}
