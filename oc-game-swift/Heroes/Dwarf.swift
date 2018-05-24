//
//  Dwarf.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 18/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

// MARK: - Dwarf class
class Dwarf: Hero {
    // MARK: Properties
    // Damage
    var damage = Axe.damage
    
    // MARK: Methods
    // Description
    override func description() -> String {
        if self.isDead {
            return super.description()
        } else {
            return super.description() + " -- \(damage) dmg"
        }
    }
    // Attack a hero
    func attackHero(_ target: Hero) {
        // Amount of damage
        target.life -= self.damage
        
        // If the target is dead
        if target.life <= 0 {
            target.isDead = true
        }
    }
}

