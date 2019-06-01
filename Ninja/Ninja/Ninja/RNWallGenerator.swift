//
//  RNWallGenerator.swift
//  Ninja
//
//  Created by Rishab Narendra  on 5/31/19.
//  Copyright © 2019 Rishab Narendra . All rights reserved.
//

import Foundation
import SpriteKit

class RNWallGenerator: SKSpriteNode {
    
    var generationTimer: Timer?
    
    func startGeneratingWalls(seconds: TimeInterval) {
        generationTimer = Timer.scheduledTimer(timeInterval: seconds, target: self, selector: #selector(generateWall), userInfo: nil, repeats: true)
    }
    
    @objc func generateWall() {
        var scale: CGFloat
        let rand = arc4random_uniform(2)
        if rand == 0 {
            scale = -1.0
        }
        else {
            scale = 1.0
        }
        let wall = RNWall()
        wall.position.x = size.width / 2 + wall.size.width / 2
        wall.position.y = scale * ((kMLGroundHeight / 2) + (wall.size.height / 2))
        addChild(wall)
    }
    
}
