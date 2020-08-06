import UIKit

// 처음 주어진 코드
//struct Grade {
//    var letter: Character
//    var points: Double
//    var credits: Double
//}
//
//class Person {
//    var firstName: String
//    var lastName: String
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//
//    func printMyName() {
//        print("My name is \(firstName) \(lastName)")
//    }
//}
//
//class Student {
//    var grades: [Grade] = []
//
//    var firstName: String
//    var lastName: String
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//
//    func printMyName() {
//        print("My name is \(firstName) \(lastName)")
//    }
//}


struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    func printMyName() {
        print("My name is \(firstName) \(lastName)")
    }
}

//상속
class Student: Person {
    var grades: [Grade] = []
}



let ho = Person(firstName: "ho", lastName: "Choi")
let jin = Student(firstName: "jin", lastName: "Choi")

ho.firstName
jin.firstName

ho.printMyName()
jin.printMyName()

let math = Grade(letter: "B", points: 8.5, credits: 3)
let history = Grade(letter: "A", points: 10.0, credits: 3)

jin.grades.append(math)
jin.grades.append(history)
//ho.grades

jin.grades.count



// 학생인데 운동선수
class StudentAthlete: Student {
    var minimumTrainingTime: Int = 2
    var trainedTime: Int = 0
    
    func train() {
        trainedTime += 1
    }
}

// 운동선수인데 축구선수
class FootballPlayer: StudentAthlete {
    var footballTeam = "FC Swift"
    
    //오버라이드
    override func train() {
        trainedTime += 2
    }
}

// Person > Student > Athelete > Football Player

var athelete1 = StudentAthlete(firstName: "Yuna", lastName: "Kim")
var athelete2 = FootballPlayer(firstName: "Heungmin", lastName: "Son")

athelete1.firstName
athelete2.firstName

athelete1.grades.append(math)
athelete2.grades.append(math)

athelete1.minimumTrainingTime
athelete2.minimumTrainingTime

//athelete1.footballTeam
athelete2.footballTeam

athelete1.train()
athelete1.trainedTime

//athelete2.train()
//athelete2.trainedTime



athelete1 = athelete2 as StudentAthlete
athelete1.train()
athelete1.trainedTime


if let son = athelete1 as? FootballPlayer {
    print("--> team:\(son.footballTeam)")
}
