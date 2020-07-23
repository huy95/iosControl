//
//  SwipeGesture.swift
//  allIOS_Basic
//
//  Created by Huy on 7/23/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class SwipeGesture: UIViewController {
    var imageNames : [String] = ["cho1","cho2","cho3","cho4","cho5","cho6","cho3","cho1"]
    var ramDom : String = ""
    
    @IBOutlet weak var usedGesture: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        usedGesture.image = UIImage(named: "cho2")
        navigationItem.title = "Swipe gesture"
        usedGesture.isUserInteractionEnabled = true // cho phep xoay trên ảnh
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        setupGesture()
    }
    func setupGesture(){
        // swipe chuyen anh nhu chuyen man hinh
        let swipeScreenright = UISwipeGestureRecognizer(target: self, action: #selector(swipeGeture(sendr:)))
        swipeScreenright.direction = .right
        usedGesture.addGestureRecognizer(swipeScreenright)
        
        let swipeScreenleft = UISwipeGestureRecognizer(target: self, action: #selector(swipeGeture(sendr:)))
        swipeScreenleft.direction = .left
        usedGesture.addGestureRecognizer(swipeScreenleft)
        
        let swipeScreenup = UISwipeGestureRecognizer(target: self, action: #selector(swipeGeture(sendr:)))
        swipeScreenup.direction = .up
        usedGesture.addGestureRecognizer(swipeScreenup)
        
        let swipeScreendown = UISwipeGestureRecognizer(target: self, action: #selector(swipeGeture(sendr:)))
        swipeScreendown.direction = .down
        usedGesture.addGestureRecognizer(swipeScreendown)
    }
    @objc func swipeGeture(sendr: UISwipeGestureRecognizer?){
        if let swipeGeture = sendr {
            switch swipeGeture.direction {
            case .right:
                ramDom = ramdomName()
                usedGesture.image = UIImage(named: ramDom)
                navigationItem.title = "right"
            case .left:
                ramDom = ramdomName()
                usedGesture.image = UIImage(named: ramDom)
                navigationItem.title = "left"
            case .up:
                ramDom = ramdomName()
                usedGesture.image = UIImage(named: ramDom)
                navigationItem.title = "up"
            case .down:
                ramDom = ramdomName()
                usedGesture.image = UIImage(named: ramDom)
                navigationItem.title = "down"
            default:
                break
            }
            
        }
    }
        func ramdomName() -> String{
            var name = imageNames.randomElement()!
            if ramDom == name {
                name = ramdomName()
            }
            return name
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
