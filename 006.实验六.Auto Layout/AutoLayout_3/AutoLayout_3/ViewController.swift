//
//  ViewController.swift
//  AutoLayout_3
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let redView = UIView()
        redView.backgroundColor = UIColor.red
        let greenView = UIView()
        greenView.backgroundColor = UIColor.blue
        let blueView = UIView()
        blueView.backgroundColor = UIColor.gray
        
        let stackView = UIStackView(arrangedSubviews: [redView,greenView,blueView])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.frame = CGRect(x: 20, y: 20, width: 200, height: 400)
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

