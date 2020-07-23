//
//  CellCustom.swift
//  allIOS_Basic
//
//  Created by Huy on 7/20/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class CellCustom: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    let image1 : UIImageView = {
           let image1 = UIImageView()
           image1.translatesAutoresizingMaskIntoConstraints = false
           image1.image = UIImage(named: "")
           image1.contentMode = .scaleToFill
           
           return image1
       }()
       var nameLabel : UILabel = {
           let nameLabel = UILabel()
           nameLabel.translatesAutoresizingMaskIntoConstraints = false
           nameLabel.text = ""
           nameLabel.font = .boldSystemFont(ofSize: 14)
           return nameLabel
       }()
       var descrip : UILabel = {
           let descrip = UILabel()
           descrip.translatesAutoresizingMaskIntoConstraints = false
           descrip.text = ""
           descrip.numberOfLines = 7
           descrip.font = .boldSystemFont(ofSize: 14)
           return descrip
       }()
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupLayout()
        // Configure the view for the selected state
    }
    func setupLayout() {
        self.addSubview(image1)
        image1.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        image1.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        image1.widthAnchor.constraint(equalToConstant: 60).isActive = true
        image1.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        self.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: image1.rightAnchor, constant: 10).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.addSubview(descrip)
        descrip.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        descrip.leftAnchor.constraint(equalTo: image1.rightAnchor, constant: 10).isActive = true
        descrip.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        descrip.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        
    }
}
