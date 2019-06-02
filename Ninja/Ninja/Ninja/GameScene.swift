//
//  GameScene.swift
//  Ninja
//
//  Created by Rishab Narendra  on 5/25/19.
//  Copyright © 2019 Rishab Narendra . All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // Game ground
    var movingGround: RNMovingGround!
    
    // Hero character
    var hero: RNHero!
    
    // Has the game started
    var isStarted = false
    
    // Has the game ended
    var isGameOver = false
    
    // Game walls
    var wallGenerator: RNWallGenerator!
    
    override func didMove(to view: SKView) {
        addBackgroundColor()
        addMovingGround()
        addHero()
        addWalls()
        addStartGameLabel()
        addPhysicsWorld()
    }
    
    // Add background color
    func addBackgroundColor() {
        backgroundColor = UIColor(red: 159.0/255.0, green: 201.0/255.0, blue: 244.0/255.0, alpha: 1.0)
    }
    
    // Add ground
    func addMovingGround() {
        movingGround = RNMovingGround(size: CGSize(width: view!.frame.width, height: kRNGroundHeight))
        movingGround.position = CGPoint(x: 0, y: view!.frame.size.height / 2)
        addChild(movingGround)
    }
    
    // Add hero
    func addHero() {
        hero = RNHero()
        hero.position = CGPoint(x: 70, y: movingGround.position.y + movingGround.frame.size.height / 2 + hero.frame.size.height / 2)
        addChild(hero)
        hero.breath()
    }
    
    // Add walls
    func addWalls() {
        wallGenerator = RNWallGenerator(color: UIColor.clear, size: view!.frame.size)
        wallGenerator.position = view!.center
        addChild(wallGenerator)
    }
    
    // Add start game label
    func addStartGameLabel() {
        let start = SKLabelNode(text: "Tap to Start!")
        start.name = "tapToStart"
        start.position.x = view!.center.x
        start.position.y = view!.center.y + 40
        start.fontSize = 30.0
        start.fontColor = UIColor.black
        start.fontName = "Helvetica"
        addChild(start)
        start.run(blinkAnimation())
    }
    
    // Add physics world
    func addPhysicsWorld() {
        physicsWorld.contactDelegate = self
    }
    
    func blinkAnimation() -> SKAction {
        let duration = 0.4
        let fadeOut = SKAction.fadeAlpha(to: 0.0, duration: duration)
        let fadeIn = SKAction.fadeAlpha(to: 1.0, duration: duration)
        let blink = SKAction.sequence([fadeOut, fadeIn])
        return SKAction.repeatForever(blink)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // If game is over, restart the game
        if isGameOver {
            restart()
        }
        // If game hasn't started, start the game
        else if !isStarted {
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
        let tapToStart = childNode(withName: "tapToStart")
        tapToStart?.removeFromParent()
        hero.stop()
        hero.startRunning()
        movingGround.startMovement()
        wallGenerator.startGeneratingWalls(seconds: 1)
    }
    
    // Game over
    func end() {
        isGameOver = true
        
        // Stop everything
        hero.fall()
        wallGenerator.stopWalls()
        movingGround.stopMovement()
        hero.stop()
        
        // Create game over label
        let gameOver = SKLabelNode(text: "Game Over!")
        gameOver.position.x = view!.center.x
        gameOver.position.y = view!.center.y + 40
        gameOver.fontSize = 30.0
        gameOver.fontColor = UIColor.black
        gameOver.fontName = "Helvetica"
        addChild(gameOver)
        gameOver.run(blinkAnimation())
    }
    
    // Restart the game
    func restart() {
        let newScene = GameScene(size: view!.bounds.size)
        newScene.scaleMode = .aspectFill
        view!.presentScene(newScene)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if !isGameOver {
            end()
        }
    }
}
