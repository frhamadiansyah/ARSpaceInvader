//
//  SpriteType.swift
//  ARSpaceInvader
//
//  Created by Fandrian Rhamadiansyah on 05/07/20.
//  Copyright © 2020 Fandrian Rhamadiansyah. All rights reserved.
//

import Foundation
import SpriteKit

enum SpriteLibrary {
    //MARK: - NewGame
    static var startGameLabel : SKNode {
        let startLabel = SKLabelNode(text: "Tap anywhere to begin")

        return startLabel as SKNode
    }
    
    
    //MARK: - GameScene
    
    static var hansip : SKNode {
        let hansip = SKSpriteNode(imageNamed: "HansipRun-1.png")
        hansip.name = "hansip"
        var hansipMoving : [SKTexture] = []
        
        for i in 1...6 {
            hansipMoving.append(SKTexture(imageNamed: "HansipRun-\(i).png"))
        }
        hansip.run(SKAction.repeatForever(SKAction.animate(with: hansipMoving, timePerFrame: 1/12)))
        return hansip as SKNode
    }
    
    static var pocong : SKNode {
        let hansip = SKSpriteNode(imageNamed: "PocongJump-1.png")
        hansip.name = "pocong"
        var hansipMoving : [SKTexture] = []
        
        for i in 1...6 {
            hansipMoving.append(SKTexture(imageNamed: "PocongJump-\(i).png"))
        }
        hansip.run(SKAction.repeatForever(SKAction.animate(with: hansipMoving, timePerFrame: 1/12)))
        return hansip as SKNode
    }
    
    //MARK: - GameOver
    static var gameOverLabel : SKNode {
        let gameOverLabel = SKLabelNode(text: "Game Over")

        return gameOverLabel as SKNode
    }
    
}
