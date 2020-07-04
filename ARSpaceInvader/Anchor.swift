//
//  Anchor.swift
//  ARSpaceInvader
//
//  Created by Fandrian Rhamadiansyah on 04/07/20.
//  Copyright © 2020 Fandrian Rhamadiansyah. All rights reserved.
//

import Foundation
import SpriteKit
import ARKit

class Anchor: ARAnchor {
    var type: NodeType?
    var sprite : SKNode?
}

enum NodeType: String {
  case hansip = "HansipRun-1.png"
  case pocong = "PocongJump-1.png"
}

