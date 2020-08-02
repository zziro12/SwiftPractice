import UIKit

//구조체

// CustomStringConvertible

//도전과제
//1.강의이름 강사이름 학생수를 가지는 struct 만들기 (lecture)
struct Lecture : CustomStringConvertible{
    var description: String{
        return "Title : \(name), Instructor: \(instructor)"
    }
    
    let name : String
    let instructor : String
    var numOfStudent : Int
}
//2.강의 어레이와 강사이름을 받아서, 해당 강사의 강의 이름을 출력하는 함수 만들기
func printLectureName(from instructor : String, lectures:[Lecture]){
//    var lectureName = ""
//
//    for lecture in lectures{
//        if instructor == lecture.instructor{
//            lectureName = lecture.name
//        }
//    }
    //줄여쓰는법 let lectureName = lectures.first { $0.instructor == instructor }?.name ?? ""
    let lectureName = lectures.first { (lec) -> Bool in return lec.instructor == instructor }?.name ?? ""
    print("강사의 강의는 : \(lectureName)")
}

//printLectureName(instructor : "jinho" )
//3. 강의 3개 만들고 강사이름으로 강의찾기

let lec1 = Lecture(name: "iOS 1", instructor: "jack", numOfStudent: 5)
let lec2 = Lecture(name: "iOS 2", instructor: "john", numOfStudent: 5)
let lec3 = Lecture(name: "iOS 3", instructor: "park", numOfStudent: 5)
let lectures = [lec1, lec2, lec3]

printLectureName(from: "jack", lectures: lectures)

//protocol 규약 , 약속

print(lec1)
