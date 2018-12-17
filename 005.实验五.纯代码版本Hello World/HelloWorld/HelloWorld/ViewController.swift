//
//  ViewController.swift
//  HelloWorld
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var i = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        let label = UILabel(frame: CGRect(x: 180, y: 200, width: 200, height: 120))
        label.text = "Hello World!"
        label.backgroundColor = UIColor.orange
        label.textAlignment = .center
        label.center = view.center
        view.addSubview(label)
        
        let button = UIButton(frame: CGRect(x: 90, y: 100, width: 200, height: 40))
        button.setTitle("点我", for: .normal)
        //        button.setTitle("I am focused", for: .highlighted)
        button.setTitleColor(UIColor.orange, for: .normal)
        button.backgroundColor = UIColor.yellow
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        
        self.title = "first View"
        print("viewdidload")
        
    }
    
    @IBAction func btnClicked(){
        if let label = view.subviews.first as? UILabel {
            i = i + 1;
            if (i%2 != 0){
                label.text = "I was clicked!"
            }else{
                label.text = "I was cilcked again!";
            }
            if(i>10){
                i = 0;
            }
        }
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    
}

