//
//  Teacher.swift
//  TableView
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 test. All rights reserved.
//

import Foundation

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
    
    //便利构造函数
    convenience init(name:String){
        self.init(department: Department.CS, title: "新增", firstName: name, lastName: "", age: 45, gender: Gender.male)
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

