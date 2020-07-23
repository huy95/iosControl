//
//  extensionButton.swift
//  allIOS_Basic
//
//  Created by Huy on 7/23/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import Foundation
import UIKit
extension UIButton{
    func pulsate(){
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
    }
    func pulsate1(){
        let pulse1 = CABasicAnimation(keyPath: "opacity")
        pulse1.duration = 0.5
        pulse1.fromValue = 1
        pulse1.toValue = 0.1
        pulse1.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        //        pulse1.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        
        pulse1.autoreverses = true
        pulse1.repeatCount = 3
        
        
        layer.add(pulse1, forKey: nil)
    }
    func pulsate2(){
        let pulse2 = CABasicAnimation(keyPath: "opacity")
        pulse2.duration = 0.1
        pulse2.repeatCount = 3
        pulse2.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        pulse2.fromValue = fromValue
        pulse2.toValue = toValue
        layer.add(pulse2, forKey: nil)
    }
}
