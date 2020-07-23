//
//  ButtonMC.swift
//  allIOS_Basic
//
//  Created by Huy on 7/18/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class ButtonMC: UIViewController {
    var stackView2: UIStackView = {
        let stackView2 = UIStackView()
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.axis = .horizontal //ngang
        stackView2.alignment = .center // lay giua lam chuan
        stackView2.distribution = .fillEqually// cac nut co kich thuoc  = nhau
        stackView2.spacing = 20
        return stackView2
    }()
    let nextButton: UIButton = {
        let button = UIButton(type: .custom)
        // set = false de layout bang code
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        //        button.setTitle("Searching", for: .highlighted)
        button.contentHorizontalAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.brown
        
        //        // set image
        //        if let nextImage = UIImage(named: "next") {
        //            button.setImage(nextImage, for: .normal )
        //        }
        
        button.setImage(UIImage(named: "next"), for: .normal )
        
        button.semanticContentAttribute = UIApplication.shared
            .userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
        
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        
        return button
    }()
    let previousButton: UIButton = {
        
        let button = UIButton(type: .custom)
        // set = false de layout bang code
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Previous", for: .normal)
        //        button.setTitle("Searching", for: .highlighted)
        button.contentHorizontalAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.brown
        
        button.setImage(UIImage(named: "previous"), for: .normal)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Button"
        view.backgroundColor = .white
        setupButton()
        // Do any additional setup after loading the view.
    }
    func setupButton() {
        
        //     searchButton
        view.addSubview(stackView2)
        stackView2.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        stackView2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        stackView2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        stackView2.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        stackView2.addArrangedSubview(nextButton)
        nextButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        stackView2.addArrangedSubview(previousButton)
        previousButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        previousButton.addTarget(self, action: #selector(searchPress), for: .touchUpInside)
        
        nextButton.addTarget(self, action: #selector(searchPress), for: .touchUpInside)
    }
    @objc func searchPress() {
        print("searchPress")
    }
    
    @IBAction func signInDidPress(_ sender: UIButton) {
        
        print("Sign In")
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
