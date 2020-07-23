//
//  CustomViewVer.swift
//  allIOS_Basic
//
//  Created by Huy on 7/22/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import Foundation
import UIKit
class Custom2View: UIView {
    
    let imageView = UIImageView()
    let bottomView = UIView()
    let desLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupLayout(){
           self.addSubview(imageView)
           imageView.addSubview(bottomView)
           bottomView.addSubview(desLabel)
           
           imageView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height )
           imageView.image = UIImage(named: "apple")
           imageView.contentMode = .scaleAspectFit
           
           bottomView.frame = CGRect(x: 0, y: self.imageView.bounds.height - 200, width: self.imageView.bounds.width, height: 100)
           bottomView.backgroundColor = .black
           bottomView.alpha = 0.5
           
           desLabel.frame = CGRect(x: 0, y: 0, width: bottomView.bounds.width, height: bottomView.bounds.height)
           desLabel.textAlignment = .center
           desLabel.text = "Apple"
           desLabel.textColor = .red
           desLabel.font = UIFont.boldSystemFont(ofSize: 24)
           
       }
    
    
}
