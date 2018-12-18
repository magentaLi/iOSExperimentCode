//
//  CityInfo.swift
//  weatherJsonDemo
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 LiJiaKun. All rights reserved.
//

import Foundation

class CityInfo {
    
    var parent:String = ""
    var name:String = ""
    var time:String = ""
    var shidu:String = ""
    var pm25:Int = 0
    var pm10:Int = 0
    var quality:String = ""
    var wendu:String = ""
    var ganmao:String = ""
    
    init(parent:String,name:String,time:String,shidu:String,pm25:Int,pm10:Int,quality:String,wendu:String,ganmao:String) {
        self.parent = parent
        self.name = name
        self.time = time
        self.shidu = shidu
        self.pm10 = pm10
        self.pm25 = pm25
        self.quality = quality
        self.wendu = wendu
        self.ganmao = ganmao
    }
}
