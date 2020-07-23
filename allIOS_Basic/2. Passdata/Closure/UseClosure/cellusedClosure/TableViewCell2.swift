//
//  TableViewCell2.swift
//  allIOS_Basic
//
//  Created by Huy on 7/22/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class TableViewCell2: UITableViewCell {
    var TitleName: UILabel = {
        let labelName = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.text = ""
        labelName.font = .boldSystemFont(ofSize: 15)
        return labelName
    }()
    var FeelName: UILabel = {
        let labelName = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.text = ""
        labelName.numberOfLines = 0
        labelName.font = .boldSystemFont(ofSize: 15)
        return labelName
    }()
    
    var post: Post? {
        didSet {
            if let post = post {
                TitleName.text = post.title
                FeelName.text = post.feel
            }
        }
    }
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
        self.addSubview(TitleName)
        TitleName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        TitleName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        TitleName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        TitleName.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        
        self.addSubview(FeelName)
        FeelName.topAnchor.constraint(equalTo: TitleName.bottomAnchor, constant: 20).isActive = true
        FeelName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        FeelName.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        FeelName.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
    }
}
