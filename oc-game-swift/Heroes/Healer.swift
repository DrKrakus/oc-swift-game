//
//  Healer.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 18/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

// MARK: - Healer class
class Healer: Hero {
    // MARK: Properties
    // Healing
    var healing = Staff.healing
    
    // MARK: - Methods
    // Heal a hero
    func healHero(_ target: Hero) {
        // Amount of healing
        target.life += self.healing
        
        // No overheal allowed
        if target.life > target.maxLife {
            target.life = target.maxLife
        }
    }
}
