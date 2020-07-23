//
//  LongGesture.swift
//  allIOS_Basic
//
//  Created by Huy on 7/23/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class LongGesture: UIViewController {
    let squareView: UIView = {
        let squareView = UIView()
        squareView.translatesAutoresizingMaskIntoConstraints = false
        squareView.backgroundColor = .green
        return squareView
    }()
    var isCheck: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        isCheck = true
        squareView.backgroundColor?.accessibilityElementsHidden = false
        setView()
        view.backgroundColor = .white
        navigationItem.title = "Long Press gesture"
        // Do any additional setup after loading the view.
    }
    
    func setView(){
        view.addSubview(squareView)
        squareView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        squareView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        squareView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress(_:)))
        squareView.addGestureRecognizer(longPressGesture)
    }
    @objc func longPress(_ gesture: UILongPressGestureRecognizer){
        print("gesture")
        isCheck = !isCheck
        kiemTra(check: isCheck)
    }
    func kiemTra(check: Bool){
        // kiểm tra nếu check là true thì nhảy vào scope if, ngược lại thì nhảy vào scope else
        if check {
            
            squareView.backgroundColor = .green
        } else{
            
            squareView.backgroundColor = .black
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
