//
//  Colossus.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 18/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

// MARK: - Colossus class
class Colossus: Hero {
    // MARK: Properties
    // Damage
    var damage = Shield.damage
    
    // MARK: Methods
    // Attack a hero
    func attackHero(_ target: Hero) {
        // Amount of damage
        target.life -= self.damage
        
        // If the target is dead
        if target.life <= 0 {
            target.life = 0
            target.isAlive = false
        }
    }
}
