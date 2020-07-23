//
//  CreateModel.swift
//  allIOS_Basic
//
//  Created by Huy on 7/22/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class CreateModel: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var feelTextView: UITextView!
    
    @IBOutlet weak var buttonSave: UIButton!
    
    // dang ki
    var passObject: ((Post) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func passDataAction(_ sender: Any) {
        // truyen du lieu
        passObject?(Post(title: titleTextField.text!, feel: feelTextView.text!))
        navigationController?.popViewController(animated: true)
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
