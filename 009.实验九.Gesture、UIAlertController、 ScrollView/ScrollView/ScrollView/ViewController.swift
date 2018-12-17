//
//  ViewController.swift
//  ScrollView
//
//  Created by 505006 on 2018/11/27.
//  Copyright © 2018年 SICNU. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView_2: UIScrollView!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //缩放的scrollView
        let imageView = UIImageView(image: UIImage(named: "1"))
        scrollView.addSubview(imageView)
        scrollView.contentSize = imageView.bounds.size
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 5
        scrollView.delegate = self
        
        //轮播的scrollView
        scrollView_2.delegate = self
        for i in 1...7{
            let imageView = UIImageView(image: UIImage(named: "\(i)"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: CGFloat(i-1) * scrollView_2.bounds.width, y: 0, width: scrollView_2.bounds.width, height: scrollView_2.bounds.height)
            scrollView_2.addSubview(imageView)
            scrollView_2.isPagingEnabled = true
        }
        scrollView_2.contentSize = CGSize(width: 7 * scrollView_2.bounds.width, height: scrollView_2.bounds.height)
        pageControl.numberOfPages = 7
        pageControl.currentPage = 0
        scrollView_2.showsHorizontalScrollIndicator = false
        pageControl.isUserInteractionEnabled = true
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView_2.contentOffset.x / scrollView_2.bounds.width)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollView.subviews.first
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pageControlClicked(_ sender: UIPageControl) {
        let rect = CGRect(x: CGFloat(pageControl.currentPage) * scrollView_2.bounds.width, y: 0, width: scrollView_2.bounds.width, height: scrollView_2.bounds.height)
        scrollView_2.scrollRectToVisible(rect, animated: true)
    }
    
    
    
}

