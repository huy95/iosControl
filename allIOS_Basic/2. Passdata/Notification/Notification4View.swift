//
//  Notification4View.swift
//  allIOS_Basic
//
//  Created by Huy on 7/22/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class Notification4View: UIViewController {
    @IBOutlet weak var titleText: UITextField!
    
    @IBOutlet weak var feeltext: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }

    @IBAction func fixButton(_ sender: Any) {
       // NotificationCenter.default.removeObserver(self, name: .notificationNamePost, object: nil)
        // B1: Tạo một biến có kiểu dữ liệu của 1 object cần truyền dữ liệu
        let post = Post(title: titleText.text!, feel: feeltext.text!)
        // B2: Push thông báo
        NotificationCenter.default.post(name: .notificationNamePost, object: post)
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
