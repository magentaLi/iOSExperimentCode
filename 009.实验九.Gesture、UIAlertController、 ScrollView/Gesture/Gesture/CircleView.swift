//
//  CircleView.swift
//  Gesture
//
//  Created by 505006 on 2018/11/26.
//  Copyright © 2018年 SICNU. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {
    
    func setup(){
        
        let panRecongnizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recongnizer:)))
        self.addGestureRecognizer(panRecongnizer)
        
        let pinchRecongnizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch(recongnizer:)))
        self.addGestureRecognizer(pinchRecongnizer)
        
        let tapRecongnizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer:)))
        self.addGestureRecognizer(tapRecongnizer)
        //点击次数
        tapRecongnizer.numberOfTapsRequired = 2
        //手指个数
        tapRecongnizer.numberOfTouchesRequired = 1
        
        let rotationRecongnizer = UIRotationGestureRecognizer(target: self, action: #selector(rotation(recongnizer:)))
        self.addGestureRecognizer(rotationRecongnizer)
        
    }
    
    //tap删除
    @objc func tap(recognizer: UITapGestureRecognizer){
        switch recognizer.state {
        case .recognized:
            recognizer.view?.removeFromSuperview()
        default:
            break
        }
    }
    
    //pinch 缩放
    @objc func pinch(recongnizer: UIPinchGestureRecognizer){
        switch recongnizer.state {
        case .changed:
            fallthrough
        case .ended:
            bounds.size = CGSize(width: bounds.width * recongnizer.scale, height: bounds.height * recongnizer.scale)
            recongnizer.scale = 1
        default:
            break
        }
    }
    
    //pan 移动
    @objc func pan(recongnizer: UIPanGestureRecognizer){
        switch recongnizer.state {
        case .changed:
            fallthrough
        case .ended:
            let translation = recongnizer.translation(in: self)
            center.x += translation.x
            center.y += translation.y
            recongnizer.setTranslation(.zero, in: self)
        default:
            break
        }
    }
    
    //rotation 旋转
    @objc func rotation(recongnizer: UIRotationGestureRecognizer){
        print(recongnizer.rotation * (180 / CGFloat.pi))
        //手势旋转的弧度
        recongnizer.view?.transform = (recongnizer.view?.transform.rotated(by: recongnizer.rotation))!
        //将上次的弧度置为1
        recongnizer.rotation = 0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    @IBInspectable var fillColor:UIColor?
    @IBInspectable var strokeColor:UIColor?
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor?.setFill()
        strokeColor?.setStroke()
        path.fill()
        path.stroke()
    }
    
}
