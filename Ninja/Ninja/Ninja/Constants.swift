//
//  Constants.swift
//  Ninja
//
//  Created by Rishab Narendra  on 5/27/19.
//  Copyright © 2019 Rishab Narendra . All rights reserved.
//

import Foundation
import UIKit

// Configuration
let kRNGroundHeight: CGFloat = 20

// Initial variables
let kDefaultMoveX: CGFloat = 320.0

// Collision detection
let heroCategory: UInt32 = 0x1 << 0
let wallCategory: UInt32 = 0x1 << 1

// Game variables
// Walls after which speed of walls will be incremented
let kNumberOfPointsPerLevel = 5
// Generation time for each level of game 
let kLevelGenerationTime: [TimeInterval] = [1.0, 0.8, 0.6, 0.4, 0.3]
