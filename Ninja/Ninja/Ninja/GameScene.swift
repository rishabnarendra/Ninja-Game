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
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 159.0/255.0, green: 201.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        movingGround = RNMovingGround(size: CGSize(width: view.frame.width, height: kMLGroundHeight))
        movingGround.position = CGPoint(x: 0, y: view.frame.size.height / 2)
        addChild(movingGround)
        
        hero = RNHero()
        hero.position = CGPoint(x: 70, y: movingGround.position.y + movingGround.frame.size.height / 2 + hero.frame.size.height / 2)
        addChild(hero)
        hero.breath()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isStarted {
            start()
        }
        else {
            hero.flip()
        }
    }
    
    func start() {
        isStarted = true
        hero.stop()
        hero.startRunning()
        movingGround.startMovement()
    }
}
