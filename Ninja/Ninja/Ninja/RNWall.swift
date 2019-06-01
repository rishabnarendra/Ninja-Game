//
//  RNWall.swift
//  Ninja
//
//  Created by Rishab Narendra  on 5/31/19.
//  Copyright © 2019 Rishab Narendra . All rights reserved.
//

import Foundation
import SpriteKit

class RNWall: SKSpriteNode {
    
    let WALL_WIDTH: CGFloat = 30.0
    let WALL_HEIGHT: CGFloat = 50.0
    let WALL_COLOR = UIColor.black
    
    init() {
        super.init(texture: nil, color: WALL_COLOR, size: CGSize(width: WALL_WIDTH, height: WALL_HEIGHT))
        startMoving()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startMoving() {
        let moveLeft = SKAction.moveBy(x: -kDefaultMoveX, y: 0, duration: 1)
        run(SKAction.repeatForever(moveLeft))
    }
}
