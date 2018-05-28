//
//  Weapon.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 28/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

// Create the Weapon class
class Weapon {
    // Damage
    var damage: Int
    // Healing
    var healing: Int
    
    // Init
    init(damage: Int, healing: Int) {
        self.damage = damage
        self.healing = healing
    }
}
