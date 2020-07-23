//
//  CustomHor.swift
//  allIOS_Basic
//
//  Created by Huy on 7/22/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import Foundation
import UIKit
struct Name {
    var image: String
    var label : String
}
class CustomView: UIView {
    var imageView = UIImageView()
    var nameLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    func setupLayout(){
        let a = self.bounds.size.width
        let b = self.bounds.size.height
        imageView.frame = CGRect(x: 0, y: 30, width: a, height: b - 100)
        self.addSubview(imageView)
        
        nameLabel.frame = CGRect(x: 0, y: 0, width: a, height: b)
        self.addSubview(nameLabel)
        
        nameLabel.textAlignment = .center
        nameLabel.font = .boldSystemFont(ofSize: 14)
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.red.cgColor
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
