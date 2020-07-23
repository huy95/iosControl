//
//  CustomTextField.swift
//  allIOS_Basic
//
//  Created by Huy on 7/18/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import Foundation
import UIKit
// tao label co login ben tren
class CustomTextField: UITextField {
    var customLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.mainBlue()
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.image = UIImage(named: "mail")
        imageView.alpha = 0.07
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    override init(frame: CGRect){
        super.init(frame: frame)
        SetLabel()
        setImage()
    }
    func SetLabel(){
       self.addSubview(customLabel)
        self.textColor = UIColor.init(red: 107/255, green: 83/255, blue: 195/255, alpha: 1)
        self.font = .systemFont(ofSize: 16)
    }
    func setImage() {
        self.addSubview(imageView)
    }
    override func layoutSubviews() {
          super.layoutSubviews()
          
          let bottomLine = CALayer()
          bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 1.0)
          bottomLine.backgroundColor = UIColor.init(red: 107/255, green: 83/255, blue: 195/255, alpha: 1).cgColor
          self.borderStyle = .none
        
          self.layer.addSublayer(bottomLine)
          
          customLabel.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
          customLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
          customLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
          customLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        
        imageView.topAnchor.constraint(equalTo: customLabel.bottomAnchor, constant: 10).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 0).isActive = true
        imageView.widthAnchor.constraint(greaterThanOrEqualToConstant: 10).isActive = true
        }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
}
}
// tao view chua textField

extension UIView{
     func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?,bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingRight:CGFloat, paddingLeft:CGFloat, paddingBottom: CGFloat, width: CGFloat, height: CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    func textContainerView(view: UIView, _ image: UIImage, _ textField: UITextField) -> UIView{
        view.backgroundColor = .clear
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.alpha = 0.07
        view.addSubview(imageView)
        
        imageView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingRight: 0, paddingLeft: 10, paddingBottom: 0, width: 24, height: 24)
        
        imageView.addSubview(textField)
        
        textField.anchor(top: nil, left: imageView.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingRight: 8, paddingLeft: 12, paddingBottom: 0, width: 0, height: 0)
        let underText = UIView()
        underText.backgroundColor = UIColor(white: 1, alpha: 0.87 )
        
        view.addSubview(underText)
        
        underText.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingRight: 8, paddingLeft: 0, paddingBottom: 0, width: 0, height: 1)
        return view
    }
    
}
extension UITextField {
    func textField(placeholder: String, isSecure: Bool) -> UITextField{
        let tf = UITextField()
        tf.borderStyle = .none
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.isSecureTextEntry = isSecure
        tf.textColor = .white
        tf.attributedPlaceholder = NSAttributedString(
            string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        return tf
    }
}
