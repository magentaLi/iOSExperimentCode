//
//  Student.swift
//  TableView
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 test. All rights reserved.
//

import Foundation

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
    
    //便利构造函数
    convenience init(name:String){
        self.init(department: Department.CS, stuNo: "添加的学号", firstName: name, lastName: "", age: 20, gender: Gender.male)
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

