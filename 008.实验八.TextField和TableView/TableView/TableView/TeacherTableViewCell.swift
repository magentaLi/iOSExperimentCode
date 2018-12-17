//
//  TeacherTableViewCell.swift
//  TableView
//
//  Created by 505006 on 2018/11/26.
//  Copyright © 2018年 SICNU. All rights reserved.
//

import UIKit

class TeacherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var sex: UILabel!
    @IBOutlet weak var department: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        img.layer.masksToBounds = true
        img.layer.cornerRadius = img.frame.size.width / 2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
