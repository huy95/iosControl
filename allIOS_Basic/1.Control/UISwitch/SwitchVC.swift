//
//  SwitchVC.swift
//  allIOS_Basic
//
//  Created by Huy on 7/18/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class SwitchVC: UIViewController {
    let checkSwitch : UISwitch = {
        let checkSwitch = UISwitch()
        checkSwitch.translatesAutoresizingMaskIntoConstraints = false
        checkSwitch.isOn = true
        checkSwitch.onTintColor = UIColor.mainBlue()
        checkSwitch.addTarget(self, action: #selector(genderDidChange), for: .valueChanged)
        checkSwitch.thumbTintColor = .red
        
//        checkSwitch.backgroundColor = .blue
        return checkSwitch
    }()
    @objc func checkAction() {
        print("abc")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSwitch()
        // Do any additional setup after loading the view.
    }
    func setupSwitch(){
        view.addSubview(checkSwitch)
        checkSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        checkSwitch.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    @IBAction func genderDidChange(_ sender: Any) {
           
           // eps kieu sender ve UISwitch
           if let genderSwitch = sender as? UISwitch {
               print("This is switch")
               print(genderSwitch.isOn)
               if genderSwitch.isOn {
                   print("On")
               } else {
                   print("Off")
               }
           } else {
               print("No")
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
