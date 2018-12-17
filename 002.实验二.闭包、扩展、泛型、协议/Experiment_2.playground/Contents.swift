//IOS实验2 2016110423_李嘉坤

import UIKit

////（1）给定一个Dictionary，Dictionary包含key值name和age，用map函数返回age字符串数组;
//let dicArr = [["name":"李明","age":18],["name":"小花","age":20],["name":"小米","age":27]]
//let res = dicArr.map {
//    $0["name"]
//}
//print(res)
//
////（2）给定一个String数组，用filter函数选出能被转成Int的字符串
//let strArr = ["123","12a","434"]
//let res2 = strArr.filter {
//    Int($0) != nil
//}
//print(res2)
//
////（3）用reduce函数把String数组中元素连接成一个字符串，以逗号分隔
//let strArr2 = ["Li","Jia","Kun"]
//let res3 = strArr2.reduce("") { (str1, str2) -> String in
//    return str1 == "" ? str2 : str1 + "," + str2
//}
//print(res3)
//
////（4）用 reduce 方法一次求出整数数组的最大值、最小值、总数和
//var array = [10,4,2,11,65]
//let temp = array.reduce((max:Int.min,min:Int.max,sum:0)) { (temp,i) in
//    return (max(temp.max,i),min(temp.min,i),temp.sum+i)
//}
//print(temp)
//
////（5）新建一个函数数组，函数数组里面保存了不同函数类型的函数，要求从数组里找出参数为一个整数，返回值为一个整数的所有函数；
////暂时不会
//
////（6）扩展Int，增加sqrt方法，可以计算Int的Sqrt值并返回浮点数，进行验证；
//extension Int{
//    func sqrt() -> Double {
//        return Darwin.sqrt(Double(self))
//    }
//}
//var test = 10
//print(test.sqrt())
//
////（7）实现一个支持泛型的函数，该函数接受任意个变量并返回最大和最小值，分别传入整数值、浮点数值、字符串进行验证。
//func searchMaxAndMin<T:Comparable> (data:[T]) -> (max:T,min:T){
//    var max = data[0]
//    var min = data[0]
//    for i in data {
//        if i > max {
//            max = i
//        }else if min > i{
//            min = i
//        }
//    }
//    return (min,max)
//}
//print(searchMaxAndMin(data: [1.23,2.3,3.62]))
//print(searchMaxAndMin(data: ["123","String","Test"]))




enum Gender:Int{
    case male=1,female
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
    //Person增加run方法(方法里面直接print输出Person XXX is running;
    func run(){
        print("Person \(self.fullName) is running!")
    }
}

//新建一个协议SchoolProtocol
enum Department{
    case CS,Math,Chinese
}
protocol SchoolProtocol{
    var department:Department {get set}
    func lendBook() -> String
}

class Teacher:Person,SchoolProtocol{
    var department: Department
    func lendBook() -> String {
        return "lendBook to teachers \(fullName)"
    }
    //Teacher类增加属性title
    var title:String
    init(department:Department,title: String,firstName: String, lastName: String, age: Int, gender: Gender) {
        self.title = title
        self.department = department
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    //实例可以直接用print输出
    override var description: String{
        return "Title: \(title) Name:\(fullName) Age:\(age) Gender:\(gender)"
    }
    //c)Teacher重载run方法
    override func run() {
        print("Teacher \(self.fullName) is running!")
    }
}

class Student:Person,SchoolProtocol{
    var department: Department
    func lendBook() -> String {
        return "lendBook to student \(fullName)"
    }
    //Student类增加属性stuNo
    var stuNo:String
    init(department:Department,stuNo:String,firstName: String, lastName: String, age: Int, gender: Gender) {
        self.stuNo = stuNo
        self.department = department
        super.init(firstName: firstName, lastName: lastName, age: 20, gender: Gender.male)
    }
    //实例可以直接用print输出
    override var description: String{
        return "stuNo: \(stuNo) Name:\(fullName) Age:\(age) Gender:\(gender)"
    }
    //c)Student重载run方法
    override func run() {
        print("Student \(self.fullName) is running!")
    }

}

//分别构造多个Person、Teacher和Student对象，并将这些对象存入同一个数组中
var person1 = Person(firstName: "Jack", lastName: "Ma", age: 45, gender: Gender.male)
var person2 = Person(firstName: "Login", lastName: "Tao", age: 20, gender: Gender.female)
var person3 = Person(firstName: "Magenta", lastName: "Li", age: 20, gender: Gender.female)

var teacher1 = Teacher(department: Department.CS, title: "Englist", firstName: "TianYi", lastName: "Li", age: 28, gender: Gender.female)
var teacher2 = Teacher(department: Department.Math, title: "Chinese", firstName: "Denahu", lastName: "Wang", age: 48, gender: Gender.male)

var stu1 = Student(department: Department.Math, stuNo: "2016110401", firstName: "Min", lastName: "An", age: 19, gender: Gender.female)
var stu2 = Student(department: Department.CS, stuNo: "2016110418", firstName: "Xing", lastName: "Jiang", age: 20, gender: Gender.male)
var stu3 = Student(department: Department.Math, stuNo: "2016110412", firstName: "Min", lastName: "Li", age: 18, gender: Gender.female)
var stu4 = Student(department: Department.CS, stuNo: "2016110425", firstName: "XinWei", lastName: "Liu", age: 22, gender: Gender.male)

var list = [person1,person2,person3,teacher1,teacher2,stu1,stu2,stu3,stu4]

//对数组进行穷举，调用每个对象的run方法，同时调用满足协议SchoolProtocol对象的lendBook方法；
for obj in list{
    obj.run()
    if let m = obj as? SchoolProtocol{
        print(m.lendBook())
    }
}

