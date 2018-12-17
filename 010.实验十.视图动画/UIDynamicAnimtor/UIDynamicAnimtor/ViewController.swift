//
//  ViewController.swift
//  UIDynamicAnimtor
//
//  Created by 505006 on 2018/11/27.
//  Copyright © 2018年 SICNU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backView: UIView!
    lazy var animator = UIDynamicAnimator(referenceView: self.backView)
    
    let gravity = UIGravityBehavior()
    let collision = UICollisionBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        collision.translatesReferenceBoundsIntoBoundary = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func add(_ sender: Any) {
        let width = Int(backView.bounds.width / 10)
        let randx = Int(arc4random() % 10) * width
        let lable = UILabel(frame: CGRect(x: randx, y: 20, width: width, height: width))
        lable.backgroundColor = UIColor.yellow
        lable.textAlignment = .center
        lable.text = "A"
        backView.addSubview(lable)
        
        gravity.addItem(lable)
        collision.addItem(lable)
    }
    
    @IBAction func up(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: -1)
    }
    
    @IBAction func left(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: -1, dy: 0)
    }
    
    @IBAction func down(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: 1)
    }
    
    @IBAction func right(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 1, dy: 0)
    }
    
    @IBAction func del(_ sender: Any) {
        for item in backView.subviews {
            if item is UILabel {
                item.removeFromSuperview()
                collision.removeItem(item)
                gravity.removeItem(item)
            }
        }
    }
    
}

