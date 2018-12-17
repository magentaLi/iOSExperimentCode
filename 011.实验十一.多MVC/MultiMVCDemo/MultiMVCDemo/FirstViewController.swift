//
//  ViewController.swift
//  MultiMVCDemo
//
//  Created by 505006 on 2018/12/5.
//  Copyright © 2018年 SICNU. All rights reserved.
//

import UIKit

//学生协议
//protocol StudentProtocal {
//    func change(name:String,no:String)
//}

class FirstViewController: UIViewController {
    //    func change(name: String, no: String) {
    //        self.name = name
    //        self.no = no
    //    }
    //
    
    @IBOutlet weak var tfNO: UITextField!
    @IBOutlet weak var tfName: UITextField!
    
    //    var name = ""
    //    var no = ""
    
    var stu = Student()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tfName.text = stu.name
        tfNO.text = stu.no
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Second"{
            stu.no = tfNO.text!
            stu.name = tfName.text!
            let secVC = segue.destination as! SecondViewController
            secVC.stu = stu
        }
        if segue.identifier == "Third"{
            let thirdVC = segue.destination as! ThirdViewController
        }
    }
    
    //    @IBAction func showSecondVC(_ sender: Any) {
    //        let secVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
    //        stu.no = tfNO.text!
    //        stu.name = tfName.text!
    //
    //        self.navigationController?.pushViewController(secVC, animated: true)
    //        secVC.stu = stu
    //    }
    //
    //    @IBAction func showThirdVC(_ sender: Any) {
    //        let secVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdVC")
    //        self.present(secVC, animated: true, completion: nil)
    //    }
    
}

