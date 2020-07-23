//
//  DatePickerVC.swift
//  allIOS_Basic
//
//  Created by Huy on 7/18/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class DatePickerVC: UIViewController {
    
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var timeTextField: UITextField!
    var timeDatePicker = UIDatePicker()
    var dateDatePicker = UIDatePicker()
    
    let dateLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setDatePicker()
        setTimePicker()
        // Do any additional setup after loading the view.
        // khi vào màn hình sẽ gọi hiển thị datePicker luôn cho trường dateTextField
        dateTextField.becomeFirstResponder()
    }
    func setDatePicker(){
        // set kiểu cho datePicker
        dateDatePicker.datePickerMode = .date
        // // gán datePicker cho textField
        dateTextField.inputView = dateDatePicker
        // Set ngày mặc định khi hiển thị
        dateDatePicker.setDate(Date(), animated: true)
        //  khởi tạo toolBar, toolBar.sizeToFit là các thành phần nằm trong nó tự dãn theo đúng kích thước width
        let toolBar = UIToolbar()
        dateTextField.inputAccessoryView = toolBar
        toolBar.sizeToFit()
        dateLabel.text = "Date Label"
        // khai báo các thành phần trong toolBar (button,label)
        let doneButton = UIBarButtonItem(title: "chon", style: .plain, target: self, action: #selector(doneDateAction))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        let label = UIBarButtonItem(customView: dateLabel)
        let cancelButton = UIBarButtonItem(title: "Huỷ", style: .plain, target: self, action: #selector(cancelAction))
        // set các thành phần vào toolBar
        toolBar.setItems([cancelButton, spaceButton, label, spaceButton, doneButton], animated: false)
        // add hành động datepicker
        dateDatePicker.addTarget(self, action: #selector(valueChangeDatePicker), for: UIControl.Event.valueChanged)
        
    }
    @objc func doneDateAction() {
        dateTextField.text = ConvertHelper.stringFromDate(date: dateDatePicker.date, format: "dd/MM/yyyy")
        timeTextField.becomeFirstResponder()
    }
    @objc func cancelAction() {
        self.view.endEditing(true)
    }
    @objc func valueChangeDatePicker() {
        dateLabel.text = ConvertHelper.stringFromDate(date: dateDatePicker.date, format: "dd/MM/yyyy")
        dateLabel.sizeToFit()
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    func setTimePicker(){
        timeDatePicker.datePickerMode = .time
        timeTextField.inputView = timeDatePicker
        
        timeDatePicker.setDate(Date(), animated: true)
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        timeTextField.inputAccessoryView = toolBar
        
        let doneButton = UIBarButtonItem(title: "Chọn", style: .plain, target: self, action: #selector(doneTimeAction))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        //        let labelButton = UIBarButtonItem(customView: )
        let cancelButton = UIBarButtonItem(title: "Huỷ", style: .plain, target: self, action: #selector(cancelAction))
        
        toolBar.setItems([cancelButton, spaceButton, spaceButton, doneButton], animated: false)
        
        timeDatePicker.addTarget(self, action: #selector(valueChangeTimePicker), for: UIControl.Event.valueChanged)
    }
    
    @objc func doneTimeAction() {
        timeTextField.text = ConvertHelper.stringFromDate(date: timeDatePicker.date, format: "HH:mm")
        self.view.endEditing(true)
    }
    @objc func valueChangeTimePicker() {
        timeTextField.text = ConvertHelper.stringFromDate(date: timeDatePicker.date, format: "HH:mm")
        timeDatePicker.sizeToFit()
    }
}
class ConvertHelper {
    static func stringFromDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let string = formatter.string(from: date)
        return string
    }
}
