import UIKit


//Property

//stored property
//computed property 접근할때마다 다시 계산됨

struct Person {
    //stored property
    var firstName : String{
//        willSet{
//            print("willSet: \(firstName) >> \(newValue)")
//        }
        
        didSet{
            print("didSet: \(oldValue) >> \(firstName)")
        }
    }
    var lastName : String
    
    //
    lazy var isPopular: Bool = {
        if fullName() == "jay park" {
            return true
        }else{
            return false
        }
    }()
    
    //computed property 접근할때마다 다시 계산됨
//    var fullName : String {
//        get{
//            return "\(firstName) \(lastName)"
//        }
//        set{
//            if let firstName = newValue.components(separatedBy: " ").first {
//                self.firstName = firstName
//            }
//            if let lastName = newValue.components(separatedBy: " ").last {
//                self.lastName = lastName
//            }
//        }
//
//    }
//    var fullName : String {
//        return "\(firstName) \(lastName)"
//    }
//
    func fullName() -> String {
        return "\(firstName) \(lastName)"
    }
    
    //type property
    static let isHuman : Bool = true
}

var person = Person(firstName: "jinho", lastName: "choi")
//person.firstName
//person.lastName
//
//person.firstName = "memmy"
//person.lastName = "kim"
//person.firstName
//person.lastName
//
//person.fullName = "jay park"
//person.firstName
//person.lastName
//
//Person.isHuman
//person.isPopular

//person.fullName
person.fullName()

//Property vs Method
//호출시 값을 하나 반환한다. 호출시 어떤 작업을 한다.
