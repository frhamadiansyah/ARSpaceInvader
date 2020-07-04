//
//  GameOverScene.swift
//  ARSpaceInvader
//
//  Created by Fandrian Rhamadiansyah on 05/07/20.
//  Copyright © 2020 Fandrian Rhamadiansyah. All rights reserved.
//

import Foundation
import SpriteKit
import ARKit

class GameOverScene: SKScene {
    
    var sceneView: ARSKView {
        return view as! ARSKView
    }
    
    var isWorldSetUp = false
    
    
    override func update(_ currentTime: TimeInterval) {
        if !isWorldSetUp {
            showGameOverLabel()
        }
    }
    
    private func showGameOverLabel() {
        guard let currentFrame =  sceneView.session.currentFrame else {
            return
        }
        
        var translation = matrix_identity_float4x4
        
        translation.columns.3.z = -0.5
        
        let transform = currentFrame.camera.transform * translation
        let anchor = Anchor(transform: transform)
        //        anchor.type = .pocong
        anchor.sprite = SpriteLibrary.gameOverLabel
        sceneView.session.add(anchor: anchor)
        print("ada pocong")
        
        isWorldSetUp = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let gameScene = Scene(size: sceneView.frame.size)
        gameScene.scaleMode = scaleMode
        gameScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        //                let transition = SKTransition.fade(with: .red, duration: 2)
        let presentAction = SKAction.run {
            self.view?.presentScene(gameScene)
        }

        
        run(presentAction)
    }
}
