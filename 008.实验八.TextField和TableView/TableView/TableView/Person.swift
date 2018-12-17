//
//  Person.swift
//  TableView
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 test. All rights reserved.
//

import Foundation

enum Gender:Int{
    case male=1,female
}

//新建一个协议SchoolProtocol
enum Department{
    case CS,Math,Chinese
}
protocol SchoolProtocol{
    var department:Department {get set}
    func lendBook() -> String
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

