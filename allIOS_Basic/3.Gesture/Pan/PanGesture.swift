//
//  PanGesture.swift
//  allIOS_Basic
//
//  Created by Huy on 7/23/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class PanGesture: UIViewController {
    // di chuyen 
    let squareView: UIView = {
           let squareView = UIView()
           squareView.translatesAutoresizingMaskIntoConstraints = false
           squareView.backgroundColor = .green
           return squareView
       }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        view.backgroundColor = .white
        navigationItem.title = "Pan gesture"
        // Do any additional setup after loading the view.
    }
    func setupLayout(){
        view.addSubview(squareView)
        squareView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        squareView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        squareView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(paned(_:)))
        squareView.addGestureRecognizer(pan)
    }
     @objc func paned(_ pan: UIPanGestureRecognizer){
            if pan.state == .changed{
                squareView.center = pan.location(in: self.view)
            }else{
                squareView.center = view.center
            }
    //        print(pan.location(in: self.view))
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
