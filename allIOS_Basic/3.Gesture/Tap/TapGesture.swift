//
//  TapGesture.swift
//  allIOS_Basic
//
//  Created by Huy on 7/23/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class TapGesture: UIViewController {

    @IBOutlet weak var testButton1: UIButton!
    
    @IBOutlet weak var testButton2: UIButton!
    @IBOutlet weak var testButton3: UIButton!
    
    @IBOutlet weak var testButton4: UIButton!
    var isCheck: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        isCheck = true
        // Do any additional setup after loading the view.
    }

    @IBAction func TapTestButton1(_ sender: Any) {
        testButton1.pulsate()
    }
    
    @IBAction func TapTestButton2(_ sender: Any) {
        testButton2.pulsate1()
    }
    @IBAction func TapTestButton3(_ sender: Any) {
        testButton3.pulsate2()
    }
    
    @IBAction func TapTestButton4(_ sender: Any) {
        isCheck = !isCheck
        kiemTra(check: isCheck)
    }
    func kiemTra(check: Bool){
        // kiểm tra nếu check là true thì nhảy vào scope if, ngược lại thì nhảy vào scope else
        if check {
            
            testButton4.backgroundColor = .red
        } else{
           
            testButton4.backgroundColor = .black
        }
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

