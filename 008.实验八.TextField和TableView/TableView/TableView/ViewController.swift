//
//  ViewController.swift
//  TableView
//
//  Created by 505006 on 2018/11/26.
//  Copyright © 2018年 SICNU. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var list = [Person]();
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lable: UILabel!
    
    @IBOutlet weak var nameTextFiled: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let stu1 = Student(department: Department.Math, stuNo: "2016110401", firstName: "Min", lastName: "An", age: 19, gender: Gender.female)
        let stu2 = Student(department: Department.CS, stuNo: "2016110418", firstName: "Xing", lastName: "Jiang", age: 20, gender: Gender.male)
        let stu3 = Student(department: Department.Math, stuNo: "2016110412", firstName: "Min", lastName: "Li", age: 18, gender: Gender.female)
        let teacher1 = Teacher(department: Department.CS, title: "Englist", firstName: "TianYi", lastName: "Li", age: 28, gender: Gender.female)
        let teacher2 = Teacher(department: Department.Math, title: "Chinese", firstName: "Denahu", lastName: "Wang", age: 48, gender: Gender.male)
        
        list = [stu1,teacher1,stu2,stu3,teacher2]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if list[indexPath.row] is Student{
            var cell: StudentTableViewCell!
            cell = (tableView.dequeueReusableCell(withIdentifier: "StuCell") as! StudentTableViewCell)
            let stu = list[indexPath.row] as! Student
            cell.age.text = "\(stu.age)"
            cell.name.text = "\(stu.firstName)"
            cell.sex.text = "\(stu.gender)"
            cell.stuNo.text = "\(stu.stuNo)"
            cell.img.image = UIImage(named: "student");
            return cell
        }else{
            var cell: TeacherTableViewCell!
            cell = (tableView.dequeueReusableCell(withIdentifier: "TeacherCell") as! TeacherTableViewCell)
            let tea = list[indexPath.row] as! Teacher
            cell.age.text = "\(tea.age)"
            cell.name.text = "\(tea.firstName)"
            cell.sex.text = "\(tea.gender)"
            cell.department.text = "\(tea.department)"
            cell.img.image = UIImage(named: "teacher");
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lable.text = "You choose \(list[indexPath.row].fullName)"
    }
    
    @IBAction func addClicked(_ sender: Any) {
        if let name = nameTextFiled.text{
            if name != "" {
                let stu = Student(name: name)
                list.append(stu)
                tableView.reloadData()
            }
        }
        nameTextFiled.resignFirstResponder()
    }
    
    @IBAction func editClicked(_ sender: Any) {
        if let row = tableView.indexPathForSelectedRow?.row {
            if let name = nameTextFiled.text {
                if name != ""{
                    list[row].firstName = name
                    tableView.reloadData()
                }
            }
        }
    }
    
    @IBAction func delClicked(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            list.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
}

