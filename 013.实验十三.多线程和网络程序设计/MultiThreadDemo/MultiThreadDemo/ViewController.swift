//
//  ViewController.swift
//  MultiThreadDemo
//
//  Created by 505006 on 2018/12/13.
//  Copyright © 2018年 LiJiaKun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sumLable: UILabel!
    @IBOutlet weak var countLable: UILabel!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.count += 1
            self.countLable.text = "\(self.count)"
            print("Timer thread:\(Thread.current)")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sum(_ sender: Any) {
        var sum = 0
        
        DispatchQueue.global().async {
            print("Sum thread:\(Thread.current)")
            for i in 1...99999999{
                sum += i
            }
            DispatchQueue.main.async {
                self.sumLable.text = "\(sum)"
            }
        }
        
    }
}

