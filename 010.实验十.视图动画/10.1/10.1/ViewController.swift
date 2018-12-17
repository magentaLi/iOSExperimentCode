//
//  ViewController.swift
//  10.1
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 2016110423. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak weakSelf=self](mytimer) in
            weakSelf?.myView.center.x += 20
        })
    }

    @IBAction func btnClicked(_ sender: Any) {
        timer?.invalidate()
        UIView.animate(withDuration: 2, delay: 1, options: [.curveEaseInOut,.autoreverse,.repeat], animations: {
            self.myView.alpha = 0
            self.myView.center.x = self.view.bounds.width
            self.myView.backgroundColor = UIColor.yellow
            self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi)).scaledBy(x: 0.5, y: 0.5)
        }){ (finished) in
            if finished {
                self.myView.removeFromSuperview()
            }
        }
    }
    
}

