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
    
    // Init
    init(name: String) {
        super.init(name: name, type: .healer, life: 125, damage: Staff.damage)
    }
    
    // MARK: - Methods
    // Description
    override func description() -> String {
        if self.isDead {
            return super.description()
        } else {
            return "\(name) || \(type) -- \(life)/\(maxLife)HP -- healing by \(healing)"
        }
    }
    
    // Heal a hero
    func healHero(_ target: Hero) {
        // No overheal allowed
        guard target.life != target.maxLife else {
            print("You waste my time, he's already full life...")
            return
        }
        // Can heal
        target.life += self.healing
        // If the life > maxLife after healing
        if target.life > target.maxLife {
            target.life = target.maxLife
        }
    }
    
}
