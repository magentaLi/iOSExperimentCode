//
//  ViewController.swift
//  weatherJsonDemo
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 LiJiaKun. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var citys:[CityInfo] = []
    let url = URL(string:"http://t.weather.sojson.com/api/weather/city/101270101")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func showCitys(_ sender: Any) {
        AF.request(url).responseJSON {(response) in
            let json = response.value as! [String:Any]
            
            let city = json["cityInfo"] as! [String:Any]
            let data = json["data"] as! [String:Any]
            
            let parent = city["parent"] as! String
            let name = city["city"] as! String
            let time = json["time"] as! String
            let shidu = data["shidu"] as! String
            let pm25 = data["pm25"] as! Int
            let pm10 = data["pm10"] as! Int
            let quality = data["quality"] as! String
            let wendu = data["wendu"] as! String
            let ganmao = data["ganmao"] as! String
            
            let cityInfo = CityInfo(parent: parent, name: name, time: time, shidu: shidu, pm25: pm25, pm10: pm10, quality: quality, wendu: wendu, ganmao: ganmao)
            self.citys.append(cityInfo)
            
            self.performSegue(withIdentifier: "ShowCitys", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCitys"{
            if let secVC = segue.destination as? CityTableViewController{
                secVC.citys = self.citys
            }
        }
    }
}

