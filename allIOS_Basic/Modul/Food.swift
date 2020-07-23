//
//  Food.swift
//  allIOS_Basic
//
//  Created by Huy on 7/20/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import Foundation
import UIKit
struct Food {
    let imageName: String
    let name: String
    let description: String
    var isSelected: Bool
}

struct Foody {
    let imageName: String
    let name: String
    let description: String
}
struct Post {
    var title: String
    var feel: String
}
class FoodClosure {
    var name: String?
    var ratingLabel: String?
    var imageMain: String?
    var descripLabel: String?
    
    var image: UIImage?
    convenience init(name: String, ratingLabel: String, imageMain: String, descripLabel: String) {
        self.init()
        self.name = name
        self.ratingLabel = ratingLabel
        self.imageMain = imageMain
        self.descripLabel = descripLabel
    }
}
struct Color {
    let name: String
    let hex: String
}
