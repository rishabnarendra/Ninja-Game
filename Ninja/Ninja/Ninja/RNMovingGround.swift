//
//  RNMovingGround.swift
//  Ninja
//
//  Created by Rishab Narendra  on 5/26/19.
//  Copyright © 2019 Rishab Narendra . All rights reserved.
//

import Foundation
import SpriteKit

class RNMovingGround: SKSpriteNode {
    
    // Ground color segments
    let NUMBER_OF_SEGMENTS = 20
    let COLOR_ONE = UIColor(red: 88.0/255.0, green: 148.0/255.0, blue: 87.0/255.0, alpha: 1.0)
    let COLOR_TWO = UIColor(red: 120.0/255.0, green: 195.0/255.0, blue: 118.0/255.0, alpha: 1.0)
    
    init(size: CGSize){
        super.init(texture: nil, color: UIColor.brown, size: CGSize(width: size.width * 2, height: size.height))
        anchorPoint = CGPoint(x: 0, y: 0.5)
        
        for i in 0 ..< NUMBER_OF_SEGMENTS {
            var segmentColor: UIColor!
            if i % 2 == 0 {
                segmentColor = COLOR_ONE
            }
            else {
                segmentColor = COLOR_TWO
            }
            
            let segment = SKSpriteNode(color: segmentColor , size: CGSize(width: self.size.width / CGFloat(NUMBER_OF_SEGMENTS), height: self.size.height))
            segment.anchorPoint = CGPoint(x: 0.0, y: 0.5)
            segment.position = CGPoint(x: CGFloat(i) * segment.size.width, y: 0)
            addChild(segment)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Start ground movement
    func startMovement(){
        // Sequence to move left and then reset the position of the ground and walls
        let duration = TimeInterval(frame.size.width / kDefaultMoveX)
        let moveLeft = SKAction.moveBy(x: -frame.size.width / 2, y: 0, duration: duration / 2)
        let resetPosition = SKAction.moveTo(x: 0, duration: 0)
        
        let moveSequence = SKAction.sequence([moveLeft, resetPosition])
        run(SKAction.repeatForever(moveSequence))
    }
    
    // Stop ground movement
    func stopMovement() {
        removeAllActions()
    }
}
