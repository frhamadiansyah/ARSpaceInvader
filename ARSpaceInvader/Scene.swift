//
//  Scene.swift
//  ARSpaceInvader
//
//  Created by Fandrian Rhamadiansyah on 04/07/20.
//  Copyright © 2020 Fandrian Rhamadiansyah. All rights reserved.
//

import SpriteKit
import ARKit

class Scene: SKScene {
    
    var sceneView: ARSKView {
        return view as! ARSKView
    }
    
    var isWorldSetUp = false
    var crossHair : SKSpriteNode!
    var scoreLabel : SKLabelNode!
    var score = 0
    
    override func didMove(to view: SKView) {
        // Setup your scene here
        crossHair = SKSpriteNode(imageNamed: "sight")
        crossHair.position = CGPoint(x: 0, y: 0)
        addChild(crossHair)
        print("muncul")
        
        scoreLabel = SKLabelNode(text: "Score : \(score)")
        scoreLabel.position = CGPoint(x: frame.size.width * 0.33, y: frame.size.height * 0.4)
        
        addChild(scoreLabel)
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if !isWorldSetUp {
            spawnPocong()
        }
        
        if UIDevice.current.orientation.isLandscape {
            scoreLabel.position = CGPoint(x: frame.size.width * 0.4, y: frame.size.height * 0.4)
        } else {
            scoreLabel.position = CGPoint(x: frame.size.width * 0.33, y: frame.size.height * 0.4)
        }

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print((touches.first?.location(in: sceneView).x)!)
        let location = crossHair.position
        let hitNodes = nodes(at: location)
        var hitTarget: SKNode?
        for node in hitNodes {
            if node.name == "pocong" {
                hitTarget = node
                break
            }
        }
        run(SKAction.playSoundFileNamed("sfx_weapon_shotgun1.wav",
                                        waitForCompletion: false))
        
        if let hitTarget = hitTarget, let anchor = sceneView.anchor(for: hitTarget) {
            let action = SKAction.run {
                self.sceneView.session.remove(anchor: anchor)
            }
            let sequence = [SKAction.wait(forDuration: 0.3), action]
            hitTarget.run(SKAction.sequence(sequence))
            score += 1
            scoreLabel.text = "Score : \(score)"
            print(score)
            
            spawnPocong()
            
            if score == 15 {
                gameFinish()
            }
        }
        
        
    }
    
    private func spawnPocong() {
        guard let currentFrame =  sceneView.session.currentFrame else {
            return
        }
        for _ in 1...3 {
            var translation = matrix_identity_float4x4
            translation.columns.3.x = Float(drand48()*2 - 1)
            translation.columns.3.z = -Float(drand48()*2 - 1)
            translation.columns.3.y = Float(drand48() - 0.5)
            let transform = currentFrame.camera.transform * translation
            let anchor = Anchor(transform: transform)
            //        anchor.type = .pocong
            anchor.sprite = SpriteLibrary.pocong
            sceneView.session.add(anchor: anchor)
            print("ada pocong")
        }
        
        isWorldSetUp = true
    }
    
    private func gameFinish() {
        let gameOverScene = GameOverScene(size: view!.frame.size)
        gameOverScene.scaleMode = scaleMode
        gameOverScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let presentAction = SKAction.run {
            self.view?.presentScene(gameOverScene)
        }
        
        
        run(presentAction)
        
    }
    
}
