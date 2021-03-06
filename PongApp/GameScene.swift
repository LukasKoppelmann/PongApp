//
//  GameScene.swift
//  Pong2
//
//  Created by Jared Davidson on 10/11/16.
//  Copyright © 2016 Archetapp. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class GameScene: SKScene {
    var audioPlayer: AVAudioPlayer?
   
    var ball = SKSpriteNode()
    var enemy = SKSpriteNode()
    var main = SKSpriteNode()
    
    var topLbl = SKLabelNode()
    var btmLbl = SKLabelNode()
    
    var score = [Int]()
    
    override func didMove(to view: SKView) {
 
        topLbl = self.childNode(withName: "topLabel") as! SKLabelNode
        btmLbl = self.childNode(withName: "btmLabel") as! SKLabelNode
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        
        print(self.view?.bounds.height)
        
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        enemy.position.y = (self.frame.height / 2) - 50
        
        main = self.childNode(withName: "main") as! SKSpriteNode
        main.position.y = (-self.frame.height / 2) + 50
        
        //scene border ------------
        let border  = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
        //-------------------------
        
        startGame()
    }
    
    func startGame() {
        score = [0,0]
        topLbl.text = "\(score[1])"
        btmLbl.text = "\(score[0])"
        ball.physicsBody?.applyImpulse(CGVector(dx: 10 , dy: 10))
    }

    func addScore(playerWhoWon : SKSpriteNode){
        
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        if playerWhoWon == main {
            score[0] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 10))
        }
        else if playerWhoWon == enemy {
            score[1] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: -10, dy: -10))
        }
        
        topLbl.text = "\(score[1])"
        btmLbl.text = "\(score[0])"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if currentGameType == .player2 {
                if location.y > 0 {
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
                if location.y < 0 {
                    
                    main.run(SKAction.moveTo(x: location.x, duration: 0.2))
                    
                }
                
            }
            else{
                main.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }

            
        }
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if currentGameType == .player2 {
                if location.y > 0 {
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
                if location.y < 0 {
                    
                    main.run(SKAction.moveTo(x: location.x, duration: 0.2))
                    
                }

            }
            else{
                main.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
            
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        
        switch currentGameType {
        case .easy:
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.3))
            break
        case .medium:
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.1))
            break
        case .hard:
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.02))
            break
        case .player2:
            
            break
        }
        
        
        
        if ball.position.y <= main.position.y - 30 {
            addScore(playerWhoWon: enemy)
            soundGoal();
        }
        if ball.position.y >= enemy.position.y + 30 {
            addScore(playerWhoWon: main)
            soundGoal();
        }
        //-------------------------
        if ball.position.y >= main.position.y + 30 && ball.position.y <= main.position.y + 35 {
            soundBump();
        }
        if ball.position.y <= enemy.position.y - 30 && ball.position.y >= enemy.position.y - 35{
            soundBump();
        }
        
        //-------------------------
        func soundBump(){
            if (loadInt(desName: "soundOn") != 0){
            let pathToSound = Bundle.main.path(forResource: "hitMetal", ofType: "wav")!
            let url = URL(fileURLWithPath: pathToSound)
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
            catch{
                // error handling
                }
            }
            else{
                //nothing
            }
        }
        
        func soundGoal(){
            if (loadInt(desName: "soundOn") != 0){
            let pathToSound = Bundle.main.path(forResource: "point", ofType: "wav")!
            let url = URL(fileURLWithPath: pathToSound)
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
            catch{
                // error handling
                }
            }
            else{
                //nothing
            }
        }
    }
    func  loadInt(desName: String) -> Int{
        let defaults = UserDefaults.standard
        if let savedValue = defaults.object(forKey: desName) as? Int{
            print("Loaded '\(savedValue)'")
            return savedValue
        }
        return 1
    }
}







