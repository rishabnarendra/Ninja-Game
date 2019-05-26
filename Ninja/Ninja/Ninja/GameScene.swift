//
//  GameScene.swift
//  Ninja
//
//  Created by Rishab Narendra  on 5/25/19.
//  Copyright © 2019 Rishab Narendra . All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var movingGround: RNMovingGround!
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 159.0/255.0, green: 201.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        movingGround = RNMovingGround(size: CGSize(width: view.frame.width, height: 20))
        movingGround.position = CGPoint(x: 0, y: view.frame.size.height / 2)
        addChild(movingGround)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        movingGround.startMovement()
    }
}
