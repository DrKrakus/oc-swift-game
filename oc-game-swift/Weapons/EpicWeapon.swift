//
//  EpicWeapon.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 28/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

// Create the Weapon class
class EpicWeapon: Weapon {
    // Epic weapon can be buffed from random chest
    // Max damage form buff
    let maxDamage: Int
    // Max heal from buff
    let maxHealing: Int
    
    // Init from Weapon
    init(damage: Int, healing: Int, maxDamage: Int, maxHealing: Int) {
        self.maxDamage = maxDamage
        self.maxHealing = maxHealing
        super.init(damage: damage, healing: healing)
    }
}
