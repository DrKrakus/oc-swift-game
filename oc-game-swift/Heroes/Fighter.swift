//
//  Fighter.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 18/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

// MARK: - Fighter class
class Fighter: Hero {
    // MARK: - Properties
    // Damage
    var damage = Sword.damage
    
    // MARK: - Methods
    // Attack a hero
    func attackHero(_ target: Hero) {
        target.life -= self.damage
    }
}
