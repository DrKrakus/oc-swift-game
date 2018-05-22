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
    // Attack a hero
    func attackHero(target: Hero) {
        target.life -= self.damage
    }
}

