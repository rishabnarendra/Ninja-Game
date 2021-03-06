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
    
    // Keep track of generated walls
    var walls = [RNWall]()
    
    // Keep track of passed walls for incrementing game points
    var wallTracker = [RNWall]()
    
    // Generate wall every n seconds
    func startGeneratingWalls(seconds: TimeInterval) {
        generationTimer = Timer.scheduledTimer(timeInterval: seconds, target: self, selector: #selector(generateWall), userInfo: nil, repeats: true)
    }
    
    // Generate wall randomnly on each side of the ground 
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
        wall.position.y = scale * ((kRNGroundHeight / 2) + (wall.size.height / 2))
        walls.append(wall)
        wallTracker.append(wall)
        addChild(wall)
    }
    
    // Stop the time generator
    func stopGenerating() {
        generationTimer?.invalidate()
    }
    
    func stopWalls() {
        stopGenerating()
        for wall in walls {
            wall.stopMoving()
        }
    }
}
