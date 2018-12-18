//
//  WeatherViewController.swift
//  weatherJsonDemo
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 LiJiaKun. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shengfen.text = cityInfo.parent
        self.city.text = cityInfo.name
        self.time.text = cityInfo.time
        self.shidu.text = cityInfo.shidu
        self.pm25.text = "\(cityInfo.pm25)"
        self.pm10.text = "\(cityInfo.pm10)"
        self.quality.text = cityInfo.quality
        self.wendu.text = cityInfo.wendu
        self.jianyi.text = cityInfo.ganmao
        
        // Do any additional setup after loading the view.
    }
    var cityInfo:CityInfo!
    
    @IBOutlet weak var shengfen: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var jianyi: UILabel!
    @IBOutlet weak var wendu: UILabel!
    @IBOutlet weak var quality: UILabel!
    @IBOutlet weak var pm10: UILabel!
    @IBOutlet weak var pm25: UILabel!
    @IBOutlet weak var shidu: UILabel!
    @IBOutlet weak var city: UILabel!
    
}
