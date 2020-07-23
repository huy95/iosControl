//
//  TextViewController.swift
//  allIOS_Basic
//
//  Created by Huy on 7/22/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

  var imagemain : UIImageView = {
        let imagemain = UIImageView()
        imagemain.translatesAutoresizingMaskIntoConstraints = false
        imagemain.image = UIImage(named: "")
        imagemain.backgroundColor = .brown
        imagemain.contentMode = .scaleToFill
        return imagemain
    }()
    var stackView1 : UIStackView = {
        let stackView1 = UIStackView()
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        
        stackView1.axis = .vertical // doc
        stackView1.alignment = .center// khoang cach ngang
        stackView1.distribution = .equalSpacing// khoang cach doc
        
        return stackView1
    }()
    var TextName: UITextField = {
        let labelName = UITextField()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.borderStyle = .roundedRect
        labelName.font = .boldSystemFont(ofSize: 15)
        labelName.placeholder = "input Data"
        
        return labelName
    }()
    var ratingLabel1: UILabel = {
        let ratingLabel = UILabel()
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.text = "✦✦✦✦✦"
        ratingLabel.backgroundColor = .brown
        ratingLabel.font = .boldSystemFont(ofSize: 50)
        return ratingLabel
    }()
    var buttonSave: UIButton = {
        let buttonSave = UIButton()
        buttonSave.translatesAutoresizingMaskIntoConstraints = false
        buttonSave.setTitle("Save", for: .normal)
        buttonSave.setTitleColor(.white, for: .normal)
        buttonSave.backgroundColor = .black
        buttonSave.addTarget(self, action: #selector(savetable), for: .touchUpInside)
        return buttonSave
    }()
     var activitidicatorView : UIActivityIndicatorView?
    @objc func savetable(){
        print("save")
        foods.append(newFood)
        navigationController?.popViewController(animated: true)
        let mainView = self.navigationController?.topViewController as? ListModelClosure
        mainView?.tableView1.reloadData()
    }
    
    var newFood = FoodClosure()
    var pikerController : UIImagePickerController?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        setupLayout()
        // image tap
        let tapImage = UITapGestureRecognizer(target: self, action: #selector(tapget(sender:)))
        imagemain.isUserInteractionEnabled = true
        imagemain.addGestureRecognizer(tapImage)
        
        //pan Gesture rating Label
        let panGestureLabelRating = UIPanGestureRecognizer(target: self, action: #selector(panInLabelRating(sender: )))
        ratingLabel1.isUserInteractionEnabled = true
        ratingLabel1.addGestureRecognizer(panGestureLabelRating)
        
        //tap Gesture rating Label
        let tapGestureLabelRating = UITapGestureRecognizer(target: self, action: #selector(panInLabelRating(sender: )))
        tapGestureLabelRating.numberOfTouchesRequired = 1
        ratingLabel1.addGestureRecognizer(tapGestureLabelRating)
        
    }
    @objc func tapget(sender: UITapGestureRecognizer){
        print("tap Image")
        pikerController = UIImagePickerController()
        pikerController?.delegate = self
        pikerController?.allowsEditing = true
        pikerController?.sourceType = .photoLibrary
        self.present(pikerController!,animated: true, completion: nil)
    }
    
    @objc func tapGestureLabelRating(sender: UITapGestureRecognizer){
        print("Tap Rating")
        let locationInView = sender.location(in: self.view)
        let newLabelRatingFrame = view.convert(ratingLabel1.frame, from: ratingLabel1.superview)
        let frame1 = CGRect(
            x: newLabelRatingFrame.origin.x, y: newLabelRatingFrame.origin.y, width: newLabelRatingFrame.size.width/5, height: newLabelRatingFrame.size.height)
        let frame2 = CGRect(
            x: newLabelRatingFrame.origin.x, y: newLabelRatingFrame.origin.y, width: 2*newLabelRatingFrame.size.width/5, height: newLabelRatingFrame.size.height)
        let frame3 = CGRect(
            x: newLabelRatingFrame.origin.x, y: newLabelRatingFrame.origin.y, width: 3*newLabelRatingFrame.size.width/5, height: newLabelRatingFrame.size.height)
        let frame4 = CGRect(
            x: newLabelRatingFrame.origin.x, y: newLabelRatingFrame.origin.y, width: 4*newLabelRatingFrame.size.width/5, height: newLabelRatingFrame.size.height)
        let frame5 = newLabelRatingFrame
        if frame1.contains(locationInView){
            ratingLabel1.text = "✭✩✩✩✩"
            print("test1")
        }else if frame2.contains(locationInView){
            ratingLabel1.text = "✭✭✩✩✩"
            print("test5")
        }
        else if frame3.contains(locationInView){
            ratingLabel1.text = "✭✭✭✩✩"
            print("test4")
        }
        else if frame4.contains(locationInView){
            ratingLabel1.text = "✭✭✭✭✩"
            print("test3")
        }
        else if frame5.contains(locationInView){
            ratingLabel1.text = "✭✭✭✭✭"
            print("test2")
        }
    }
    
    @objc func panInLabelRating(sender: UIGestureRecognizer){
        print("pan Rating")
        let locationInView = sender.location(in: self.view)
        let newLabelRatingFrame = view.convert(ratingLabel1.frame, from: ratingLabel1.superview)
        let frame1 = CGRect(
            x: newLabelRatingFrame.origin.x, y: newLabelRatingFrame.origin.y, width: newLabelRatingFrame.size.width/5, height: newLabelRatingFrame.size.height)
        let frame2 = CGRect(
            x: newLabelRatingFrame.origin.x, y: newLabelRatingFrame.origin.y, width: 2*newLabelRatingFrame.size.width/5, height: newLabelRatingFrame.size.height)
        let frame3 = CGRect(
            x: newLabelRatingFrame.origin.x, y: newLabelRatingFrame.origin.y, width: 3*newLabelRatingFrame.size.width/5, height: newLabelRatingFrame.size.height)
        let frame4 = CGRect(
            x: newLabelRatingFrame.origin.x, y: newLabelRatingFrame.origin.y, width: 4*newLabelRatingFrame.size.width/5, height: newLabelRatingFrame.size.height)
        let frame5 = newLabelRatingFrame
        if frame1.contains(locationInView){
            ratingLabel1.text = "✭✩✩✩✩"
            print("test1")
        }else if frame2.contains(locationInView){
            ratingLabel1.text = "✭✭✩✩✩"
            print("test5")
        }
        else if frame3.contains(locationInView){
            ratingLabel1.text = "✭✭✭✩✩"
            print("test4")
        }
        else if frame4.contains(locationInView){
            ratingLabel1.text = "✭✭✭✭✩"
            print("test3")
        }
        else if frame5.contains(locationInView){
            ratingLabel1.text = "✭✭✭✭✭"
            print("test2")
        }
        newFood.ratingLabel = ratingLabel1.text
    }
    
    
    
    
    func setupLayout(){
        
        view.addSubview(stackView1)
        stackView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        stackView1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        stackView1.heightAnchor.constraint(equalToConstant: 500).isActive = true
        stackView1.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        //        stackView1.leftAnchor.constraint(equalTo: imagemain.rightAnchor, constant: 10).isActive = true
        stackView1.addArrangedSubview(TextName)
        
        TextName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        TextName.widthAnchor.constraint(equalToConstant: 200).isActive = true
        TextName.delegate = self
        
        stackView1.addArrangedSubview(imagemain)
        imagemain.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imagemain.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        stackView1.addArrangedSubview(ratingLabel1)
        stackView1.addArrangedSubview(buttonSave)
        buttonSave.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonSave.widthAnchor.constraint(equalToConstant: 150).isActive = true
        buttonSave.layer.cornerRadius = 10
        
        
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
extension TextViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        newFood.name = textField.text ?? ""
        textField.resignFirstResponder()
    }
}
extension TextViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chooseImage : UIImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        
        //tao global khi cho load anh
        self.activitidicatorView = UIActivityIndicatorView(style: .medium)
        self.activitidicatorView?.color = UIColor.white
        self.view.addSubview(self.activitidicatorView!)
        self.activitidicatorView?.frame = self.imagemain.frame
        self.activitidicatorView?.center = self.imagemain.center
        self.activitidicatorView?.startAnimating()
        //  khi nhan vao chon anh
        DispatchQueue.global().async {
            sleep(5)
            DispatchQueue.main.async {
//                self.newFood.image = chooseImage
                self.imagemain.image = chooseImage
                self.activitidicatorView!.stopAnimating()
            }
        }
        // load anh anh sau khi chon
        picker.dismiss(animated: true, completion: {
           
//        self.activitidicatorView = UIActivityIndicatorView(style: .medium)
//        self.activitidicatorView?.color = UIColor.white
//        self.view.addSubview(self.activitidicatorView!)
//        self.activitidicatorView?.frame = self.imagemain.frame
//        self.activitidicatorView?.center = self.imagemain.center
        self.activitidicatorView?.startAnimating()
            
            DispatchQueue.global().async {
                sleep(5)
                DispatchQueue.main.async {
                    self.newFood.image = chooseImage
                    self.imagemain.image = chooseImage
                    self.activitidicatorView!.stopAnimating()
                }
            }
        })
    }
}
