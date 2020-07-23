//
//  UsedDelegateVC.swift
//  allIOS_Basic
//
//  Created by Huy on 7/23/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class UsedDelegateVC: UIViewController {
    
    @IBOutlet weak var titleLAbel: UILabel!
    
    @IBOutlet weak var feelLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Delegate Main"
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func nextAction(_ sender: Any) {
        let nextVC = PassDataDelegate()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
        // b5 khai bao sư dụng delegate
        nextVC.myDelegate = self
    }
  
    
}
extension UsedDelegateVC: MyDelegate {
    func backDelegate(text1: String, text2: String) {
        titleLAbel.text = text1
        feelLabel.text = text2
    }
    
    
}
