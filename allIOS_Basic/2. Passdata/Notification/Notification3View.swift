//
//  Notification3View.swift
//  allIOS_Basic
//
//  Created by Huy on 7/22/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class Notification3View: UIViewController {

    @IBOutlet weak var feelTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Post Data"

        // Do any additional setup after loading the view.
    }

    @IBAction func postData(_ sender: Any) {
        // B1: Tạo một biến có kiểu dữ liệu của 1 object cần truyền dữ liệu
        let post = Post(title: feelTextField.text!, feel: titleTextField.text!)
        // B2: Push thông báo
        NotificationCenter.default.post(name: .notificationNamePost, object: post)
       
    }
}
extension Notification.Name {
    static let notificationNamePost = Notification.Name(rawValue: "Notification.post")
    static let noticicationNameBlog = Notification.Name(rawValue: "Notification.blog")
}
