//
//  PinchGesture.swift
//  allIOS_Basic
//
//  Created by Huy on 7/23/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class PinchGesture: UIViewController {
    let squareView: UIView = {
        let squareView = UIView()
        squareView.translatesAutoresizingMaskIntoConstraints = false
        squareView.backgroundColor = .green
        return squareView
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        view.backgroundColor = .white
        navigationItem.title = "Pinch gesture"
        imageView.image = UIImage(named: "barrafina")
        // Do any additional setup after loading the view.
    }
    func setupLayout(){
        view.addSubview(squareView)
        squareView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        squareView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        squareView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinched(_:)))
        squareView.addGestureRecognizer(pinchGesture)
        
        let gesturePinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchGesture(_:)))
        imageView.addGestureRecognizer(gesturePinch)
    }
    @objc func pinched(_ pinched: UIPinchGestureRecognizer){
        if pinched.state == .ended{
            squareView.transform = CGAffineTransform.identity
        }else{
            squareView.transform = CGAffineTransform(scaleX: pinched.scale , y: pinched.scale)
        }
    }
    
    @objc func pinchGesture(_ pinched: UIPinchGestureRecognizer){
        if pinched.state == .ended{
            imageView.transform = CGAffineTransform.identity
        }else{
            imageView.transform = CGAffineTransform(scaleX: pinched.scale , y: pinched.scale)
            print(pinched.scale)
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
