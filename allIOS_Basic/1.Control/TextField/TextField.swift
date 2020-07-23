//
//  TextField.swift
//  allIOS_Basic
//
//  Created by Huy on 7/18/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class TextField: UIViewController {
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "input pass"
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 0.5
        textField.borderStyle = .line
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.backgroundColor = .white
        
        // them textFielw vao anh
        textField.background = UIImage(named: "login_pass")
        // layout text trong anh
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 56))
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 56))
        textField.leftViewMode = UITextField.ViewMode.always
        textField.rightViewMode = UITextField.ViewMode.always
        return textField
    }()
    var textField2 : CustomTextField = {
        let textField2 = CustomTextField()
        textField2.translatesAutoresizingMaskIntoConstraints = false
        textField2.customLabel.text = "Login"
        textField2.imageView.image = UIImage(named: "mail")
        textField2.keyboardType = .emailAddress
        return textField2
    }()
     var confirmTextField: CustomTextField = {
          let textField = CustomTextField()
          textField.translatesAutoresizingMaskIntoConstraints = false
          textField.customLabel.text = "test text"
    //      textField.isSecureTextEntry = true
          return textField
    }()
    override func viewDidLoad() {
        title = "TextField"
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        textField.delegate = self
        // Do any additional setup after loading the view.
    }
    func setupLayout(){
        view.addSubview(textField)
        textField.widthAnchor.constraint(equalToConstant: 280).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 128).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(textField2)
        textField2.widthAnchor.constraint(equalToConstant: 280).isActive = true
        textField2.heightAnchor.constraint(equalToConstant: 56).isActive = true
        textField2.topAnchor.constraint(equalTo: textField.topAnchor, constant: 100).isActive = true
        textField2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        view.addSubview(confirmTextField)
        confirmTextField.widthAnchor.constraint(equalToConstant: 280).isActive = true
        confirmTextField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        confirmTextField.topAnchor.constraint(equalTo: textField2.topAnchor, constant: 100).isActive = true
        confirmTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
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
extension TextField: UITextFieldDelegate {
    
    // su kien khi go textfield
    // return true de go textfield
    // return false thi khong go duoc textfield
    // gia tri truyen vao string tra ve chu cuoi cung
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
            let textRange = Range(range, in: text){
            let updateText = text.replacingCharacters(in: textRange, with: string)
            print(text)
            
            // chi nhap 10 ki tu
            if updateText.count > 10 {
                return false
            }
        }
        return true
    }
    // khi bat dau nhan vao
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("end Editing")
    }
    // khi ket thuc nhan
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("begin Editing")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("return")// nut nhan return tren keyboard
        textField.resignFirstResponder()
        return true
    }
}

