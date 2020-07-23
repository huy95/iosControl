//
//  PassDataDelegate.swift
//  allIOS_Basic
//
//  Created by Huy on 7/23/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit
// b1 - taọ protocol
protocol MyDelegate {
    //B2: tạo một hàm bắt buộc (required - bắt buộc hoặc optional - không bắt buộc, nếu không có thì hệ thống tự hiểu là bắt buộc
    func backDelegate(text1: String, text2: String)
}

class PassDataDelegate: UIViewController {
    
    @IBOutlet weak var titleTextF: UITextField!
    
    @IBOutlet weak var feelTextF: UITextField!
    //b3 Khai báo một biến delegate kiểu protocol
    var myDelegate: MyDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func actionBack(_ sender: Any) {
        //b4 truyên dữ liệu
        myDelegate?.backDelegate(text1: titleTextF.text!, text2: feelTextF.text!)
        dismiss(animated: true, completion: nil)
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
