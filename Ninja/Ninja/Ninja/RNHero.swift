//
//  RNHero.swift
//  Ninja
//
//  Created by Rishab Narendra  on 5/26/19.
//  Copyright © 2019 Rishab Narendra . All rights reserved.
//

import Foundation
import SpriteKit

class RNHero: SKSpriteNode {
    
    var body: SKSpriteNode!
    var arm: SKSpriteNode!
    var leftFoot: SKSpriteNode!
    var rightFoot: SKSpriteNode!
    
    init() {
        super.init(texture: nil, color: UIColor.clear, size: CGSize(width: 32, height: 44))
        
        // Body of our hero
        body = SKSpriteNode(color: UIColor.black, size: CGSize(width: self.frame.size.width, height: 40))
        body.position = CGPoint(x: 0, y: 2)
        addChild(body)
        
        // Face of our hero
        let skinColor = UIColor(red: 207.0/255.0, green: 193.0/255.0, blue: 168.0/255.0, alpha: 1.0)
        let face = SKSpriteNode(color: skinColor, size: CGSize(width: self.frame.size.width, height: 12))
        face.position = CGPoint(x: 0, y: 6)
        body.addChild(face)
        
        // Eyes of our hero
        let eyeColor = UIColor.white
        let leftEye = SKSpriteNode(color: eyeColor, size: CGSize(width: 6, height: 6))
        let rightEye = leftEye.copy() as! SKSpriteNode
        let pupil = SKSpriteNode(color: UIColor.black, size: CGSize(width: 3, height: 3))
        pupil.position = CGPoint(x: 2, y: 0)
        leftEye.addChild(pupil)
        rightEye.addChild(pupil.copy() as! SKSpriteNode)
        leftEye.position = CGPoint(x: -4, y: 0)
        face.addChild(leftEye)
        rightEye.position = CGPoint(x: 14, y: 0)
        face.addChild(rightEye)
        
        // Eyebrows of our hero
        let eyebrow = SKSpriteNode(color: UIColor.black, size: CGSize(width: 11, height: 1))
        eyebrow.position = CGPoint(x: -1, y: leftEye.size.height / 2)
        leftEye.addChild(eyebrow)
        rightEye.addChild(eyebrow.copy() as! SKSpriteNode)
        
        // Arm and hand of our hero
        let armColor = UIColor(red: 46/255, green: 46/255, blue: 46/255, alpha: 1.0)
        arm = SKSpriteNode(color: armColor, size: CGSize(width: 8, height: 14))
        arm.anchorPoint = CGPoint(x: 0.5, y: 0.9)
        arm.position = CGPoint(x: -10, y: -7)
        body.addChild(arm)
        let hand = SKSpriteNode(color: skinColor, size: CGSize(width: arm.size.width, height: 5))
        hand.position = CGPoint(x: 0, y: (-arm.size.height * 0.9) + (hand.size.height / 2))
        arm.addChild(hand)
        
        // Feet of our hero
        leftFoot = SKSpriteNode(color: UIColor.black, size: CGSize(width: 9, height: 4))
        leftFoot.position = CGPoint(x: -6, y: (-size.height / 2) + (leftFoot.size.height / 2))
        addChild(leftFoot)
        rightFoot = leftFoot.copy() as! SKSpriteNode
        rightFoot.position.x = 8
        addChild(rightFoot)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
