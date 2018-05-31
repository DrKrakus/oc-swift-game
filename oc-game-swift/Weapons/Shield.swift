//
//  Shield.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 18/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

// Create the Shield class
class Shield: Weapon {
    // Init from Weapon
    init() {
        super.init(damage: 5, healing: 0)
    }
}
