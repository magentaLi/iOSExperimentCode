//IOS实验一 2016110423_李嘉坤

//import UIKit
//
////找出从1-10000的所有质数，将找出的质数存入可变数组，对数组进行正反排序并输出结果(采用5种以上的方法实现)；
//var primeNums:Array = [Int]()
//var isPrime:Bool
//for x in 2...100 {
//    isPrime = true
//    for y in 2..<x{
//        if (x%y == 0){
//            isPrime = false
//            break
//        }
//    }
//    if (isPrime) {
//        primeNums.append(x)
//    }
//}
//
////方法1
//primeNums.sort(){
//    $0 > $1
//}
//print(primeNums)
//
////方法2
//primeNums.sort { (a, b) -> Bool in
//    a > b
//}
//print(primeNums)
//
////方法3
//primeNums.sort(by: {$0 > $1})
//print(primeNums)
//
////方法4
//func mySort(num1:Int,num2:Int) -> Bool{
//    return num1 > num2
//}
//primeNums.sort(by: mySort)
//print(primeNums)

////方法5
//primeNums.sort(by: {(num1,num2) in return num1 > num2})
//print(primeNums)
//
//
//作业2（枚举，类，派生）
enum Gender:Int{
    case male = 1,female
}

//实现Person类
class Person:CustomStringConvertible{
    //要求具有firstName,  lastName，age，gender等存储属性
    var firstName:String
    var lastName:String
    var age:Int
    //其中gender是枚举类型
    var gender:Gender
    //fullName计算属性
    var fullName:String{
        get{
            return firstName + " " + lastName
        }
    }
    //指定构造函数
    init(firstName:String,lastName:String,age:Int,gender:Gender) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    //便利构造函数
    convenience init(name:String){
        self.init(firstName: name, lastName: "", age: 18, gender: Gender.male)
    }

    //两个Person实例对象可以用==和!=进行比较
    static func == (p1:Person,p2:Person) -> Bool {
        if p1.fullName == p2.fullName && p1.age == p2.age{
            return true
        }else{
            return false
        }
    }
    static func != (p1:Person,p2:Person) -> Bool {
        if p1.fullName != p2.fullName && p1.age != p2.age{
            return true
        }else{
            return false
        }
    }
    //Person实例可以直接用print输出
    var description: String{
        return "Name:\(fullName) Age:\(age) Gender:\(gender)"
    }

}
var p1 = Person(name: "LJK")
var p2 = Person(name: "LJK")
print(p2)
print(p2)
if p1 == p2 {
    print("p1和p2是同一个人")
}else{
    print("p1和p2不是同一个人")
}

class Teacher:Person{
    //Teacher类增加属性title
    var title:String
    init(title: String,firstName: String, lastName: String, age: Int, gender: Gender) {
        self.title = title
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    convenience init(title:String){
        self.init(title: title, firstName: "teacherLJK", lastName: "", age: 25, gender: Gender.female)
    }
    //实例可以直接用print输出
    override var description: String{
        return "Title: \(title) Name:\(fullName) Age:\(age) Gender:\(gender)"
    }
}

//var teacher = Teacher(title: "English")
//print(teacher)

class Student:Person{
    //Student类增加属性stuNo
    var stuNo:String
    init(stuNo:String,firstName: String, lastName: String, age: Int, gender: Gender) {
        self.stuNo = stuNo
        super.init(firstName: firstName, lastName: lastName, age: 20, gender: Gender.male)
    }
    convenience init(stuNo:String){
        self.init(stuNo: stuNo, firstName: "stuLJK", lastName: "", age: 20, gender: Gender.male)
    }
    //实例可以直接用print输出
    override var description: String{
        return "stuNo: \(stuNo) Name:\(fullName) Age:\(age) Gender:\(gender)"
    }
}

//var stu = Student(stuNo: "2016110423")
//print(stu)

//分别构造多个Person、Teacher和Student对象，并将这些对象存入同一个数组中
var person1 = Person(firstName: "Jack", lastName: "Ma", age: 45, gender: Gender.male)
var person2 = Person(firstName: "Login", lastName: "Tao", age: 20, gender: Gender.female)
var person3 = Person(firstName: "Magenta", lastName: "Li", age: 20, gender: Gender.female)

var teacher1 = Teacher(title: "Englist", firstName: "TianYi", lastName: "Li", age: 28, gender: Gender.female)
var teacher2 = Teacher(title: "Chinese", firstName: "Denahu", lastName: "Wang", age: 48, gender: Gender.male)

var stu1 = Student(stuNo: "2016110401", firstName: "Min", lastName: "An", age: 19, gender: Gender.female)
var stu2 = Student(stuNo: "2016110418", firstName: "Xing", lastName: "Jiang", age: 20, gender: Gender.male)
var stu3 = Student(stuNo: "2016110412", firstName: "Min", lastName: "Li", age: 18, gender: Gender.female)
var stu4 = Student(stuNo: "2016110425", firstName: "XinWei", lastName: "Liu", age: 22, gender: Gender.male)

var list = [person1,person2,person3,teacher1,teacher2,stu1,stu2,stu3,stu4];
var numsOfThem = [
    "numsOfPerson":0,
    "numsOfTeacher":0,
    "numsOfstudent":0
]
//分别统计Person、Teacher和Student对象的个数并放入一字典中
var numsOfPerson = 0,numsOfTeacher = 0,numsOfstudent = 0
for obj in list{
    if obj is Teacher{
        numsOfTeacher += 1
    }
    if obj is Student{
        numsOfstudent += 1
    }
    if obj is Person{
        numsOfPerson += 1
    }
}
//统计完后输出字典内容
numsOfThem["numsOfstudent"] = numsOfstudent
numsOfThem["numsOfTeacher"] = numsOfTeacher
numsOfThem["numsOfPerson"] = numsOfPerson
print(numsOfThem)

//对数组按以下要求排序并输出：age、fullName
list.sort { (p1:Person, p2:Person) -> Bool in
    return (p1.age > p2.age && p1.fullName > p2.fullName && p1.gender.rawValue + p1.age
    > p2.gender.rawValue + p2.age)
}
print(list)

