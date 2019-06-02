//
//  RNPointsLabel.swift
//  Ninja
//
//  Created by Rishab Narendra  on 6/2/19.
//  Copyright © 2019 Rishab Narendra . All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class RNPointsLabel: SKLabelNode {
    
    var number = 0
    
    init(num: Int) {
        super.init()
        
        fontColor = UIColor.black
        fontName = "Helvetica"
        fontSize = 24.0
        number = num
        text = "\(num)"
    }
    
    func increment() {
        number += 1
        text = "\(number)"
        
    }
    
    func setTo(num: Int) {
        self.number = num
        text = "\(self.number)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
