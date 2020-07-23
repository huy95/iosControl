//
//  RotateGesture.swift
//  allIOS_Basic
//
//  Created by Huy on 7/23/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class RotateGesture: UIViewController {
    let squareView: UIView = {
        let squareView = UIView()
        squareView.translatesAutoresizingMaskIntoConstraints = false
        squareView.backgroundColor = .green
        return squareView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        view.backgroundColor = .white
        navigationItem.title = "Rotate gesture"
        // Do any additional setup after loading the view.
    }
    func setView(){
        view.addSubview(squareView)
        squareView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        squareView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        squareView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotate(_:)))
        squareView.addGestureRecognizer(rotateGesture)
    }
    @objc func rotate(_ gesture: UIRotationGestureRecognizer){
           if gesture.state == .ended{
               squareView.transform = CGAffineTransform.identity
           }else{
               squareView.transform = CGAffineTransform.init(rotationAngle: gesture.rotation)
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
