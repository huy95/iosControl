//
//  StepperVC.swift
//  allIOS_Basic
//
//  Created by Huy on 7/18/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class StepperVC: UIViewController {
    var stepperM : UIStepper = {
        let stepperM = UIStepper()
        stepperM.translatesAutoresizingMaskIntoConstraints = false
        stepperM.tintColor = .red
        stepperM.maximumValue = 100
        stepperM.minimumValue = 0
        stepperM.stepValue = 10
        stepperM.addTarget(self, action: #selector(changeAction), for: .valueChanged)
        
        return stepperM
    }()
    
    var label1 = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = "0.0"
        view.backgroundColor = .white
        setupStepper()
        label1.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        view.addSubview(label1)
        // Do any additional setup after loading the view.
    }
    @objc func changeAction() {
        
        label1.text = String(stepperM.value)
    }
    func setupStepper(){
        view.addSubview(stepperM)
        stepperM.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stepperM.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
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
