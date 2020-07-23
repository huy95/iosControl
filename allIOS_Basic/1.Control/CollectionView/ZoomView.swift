//
//  ZoomView.swift
//  allIOS_Basic
//
//  Created by Huy on 7/20/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class ZoomView: UIViewController {
    var image: UIImage?
    let squareView: UIView = {
        let squareView = UIView()
        squareView.translatesAutoresizingMaskIntoConstraints = false
        squareView.backgroundColor = .white
        return squareView
    }()
    var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        //        imageView.image = UIImage(named: "")
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupLa()
        // Do any additional setup after loading the view.
    }
    func setupLa(){
        view.addSubview(squareView)
        //        squareView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //        squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        //        squareView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        //        squareView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        squareView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        squareView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        squareView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        squareView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinched(_:)))
        
        squareView.addGestureRecognizer(pinchGesture)
        
        view.addSubview(imageView)
        imageView.image = image
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300 ).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        
        imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        let gesturePinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchGesture(_:)))
        squareView.addGestureRecognizer(pinchGesture)
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
