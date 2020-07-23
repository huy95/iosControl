//
//  CellCib.swift
//  allIOS_Basic
//
//  Created by Huy on 7/20/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class CellCib: UITableViewCell {
    @IBOutlet weak var imageMain: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelDetail: UILabel!
    
    @IBOutlet weak var imageCheck: UIImageView!
    
    var foodCell : Food? {
        didSet {
            if let foodCell = foodCell {
                imageMain.image = UIImage(named: foodCell.imageName)
                labelName.text = foodCell.name
                labelDetail.text = foodCell.description
                imageCheck.image = UIImage(named: foodCell.isSelected ? "checked" : "unchecked")
            }
        }
    }
    // B1: Khai báo một closure
    // B2: dòng 45
    // B3: Trong cellForRow At Indexpath file TableViewController.swift
    var passAction: (() -> Void)?
    var truyenFoodName: ((String) -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageCheck.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(changeSelect))
        imageCheck.addGestureRecognizer(gesture)
    }
    @objc func changeSelect(){
        // B2: gọi closure
               // ? để nếu không có chỗ nào đăng kí closure này thì thôi không gọi đến closure
        passAction?()
        // ?? neu food.name nil thi lay gia tri mac dinh
        truyenFoodName?(foodCell?.name ?? "Khong co ten")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
