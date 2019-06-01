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
    
    // Game ground
    var movingGround: RNMovingGround!
    
    // Hero character
    var hero: RNHero!
    
    // Has the game started
    var isStarted = false
    
    // Game walls
    var wallGenerator: RNWallGenerator!
    
    override func didMove(to view: SKView) {
        // Add background color
        backgroundColor = UIColor(red: 159.0/255.0, green: 201.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        
        // Add ground
        movingGround = RNMovingGround(size: CGSize(width: view.frame.width, height: kRNGroundHeight))
        movingGround.position = CGPoint(x: 0, y: view.frame.size.height / 2)
        addChild(movingGround)
        
        // Add hero
        hero = RNHero()
        hero.position = CGPoint(x: 70, y: movingGround.position.y + movingGround.frame.size.height / 2 + hero.frame.size.height / 2)
        addChild(hero)
        hero.breath()
        
        // Add walls
        wallGenerator = RNWallGenerator(color: UIColor.clear, size: view.frame.size)
        wallGenerator.position = view.center
        addChild(wallGenerator)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // If game hasn't started, start the game
        if !isStarted {
            start()
        }
        // Flip the hero to other side 
        else {
            hero.flip()
        }
    }
    
    // Start moving the character
    func start() {
        isStarted = true
        hero.stop()
        hero.startRunning()
        movingGround.startMovement()
        wallGenerator.startGeneratingWalls(seconds: 1)
    }
}
