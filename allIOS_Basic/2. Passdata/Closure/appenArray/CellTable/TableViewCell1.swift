//
//  TableViewCell1.swift
//  allIOS_Basic
//
//  Created by Huy on 7/22/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class TableViewCell1: UITableViewCell {
    var imagemain : UIImageView = {
        let imagemain = UIImageView()
        imagemain.translatesAutoresizingMaskIntoConstraints = false
        imagemain.image = UIImage(named: "")
        imagemain.contentMode = .scaleToFill
        return imagemain
    }()
    var stackView1 : UIStackView = {
        let stackView1 = UIStackView()
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.axis = .vertical
        stackView1.alignment = .leading

        stackView1.distribution = .fillProportionally
    
        return stackView1
    }()
    var labelName: UILabel = {
       let labelName = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.text = ""
        labelName.font = .boldSystemFont(ofSize: 15)
        return labelName
    }()
    var ratingLabel12: UILabel = {
       let ratingLabel = UILabel()
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.text = "✦ ✦ ✦ ✦ ✦"
        return ratingLabel
    }()
    var detailLabel: UILabel = {
          let detailLabel = UILabel()
           detailLabel.translatesAutoresizingMaskIntoConstraints = false
           detailLabel.text = ""
           detailLabel.numberOfLines = 3
           detailLabel.font = .boldSystemFont(ofSize: 15)
           return detailLabel
       }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupLayout()
        // Configure the view for the selected state
    }
     func setupLayout(){
            self.addSubview(imagemain)
            imagemain.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            imagemain.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
            imagemain.heightAnchor.constraint(equalToConstant: 100).isActive = true
            imagemain.widthAnchor.constraint(equalToConstant: 100).isActive = true
            
            self.addSubview(stackView1)
            stackView1.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
            stackView1.leftAnchor.constraint(equalTo: imagemain.rightAnchor, constant: 10).isActive = true
            stackView1.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
            stackView1.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
            stackView1.addArrangedSubview(labelName)
    //        labelName.heightAnchor.constraint(equalToConstant: 30).isActive = true
            stackView1.addArrangedSubview(ratingLabel12)
    //        ratingLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
            stackView1.addArrangedSubview(detailLabel)
            
        }

}
