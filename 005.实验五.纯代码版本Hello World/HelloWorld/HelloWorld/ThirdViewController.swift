//
//  ThirdViewController.swift
//  HelloWorld
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 test. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        let label = UILabel(frame: CGRect(x: 180, y: 200, width: 200, height: 120))
        label.text = "到底了，请返回!"
        label.backgroundColor = UIColor.orange
        label.textAlignment = .center
        label.center = view.center
        view.addSubview(label)
        
        self.title = "Third View"
        print("viewdidload")
    }
}
