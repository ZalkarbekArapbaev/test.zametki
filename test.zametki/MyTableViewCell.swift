//
//  MyTableViewCell.swift
//  test.zametki
//
//  Created by zalkarbek on 24/10/22.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var imageKquar: UIImageView!
    
    @IBOutlet weak var labelZametki: UILabel!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageKquar.isUserInteractionEnabled = true
        let add = UITapGestureRecognizer(target: self, action: #selector(addImage))
        imageKquar.addGestureRecognizer(add)
    }
    
    @objc func addImage() {
        imageKquar.image = UIImage(named: "2")
    }

}
