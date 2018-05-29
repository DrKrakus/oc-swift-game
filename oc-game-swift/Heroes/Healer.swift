//
//  Healer.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 18/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

// Create the Healer class
class Healer: Hero {
    // MARK: Properties
    // Healing
    var healing = Staff.healing
    
    // MARK: - Methods
    /// Init the Healer subclass
    /// - name: String, Name of the healer
    init(name: String) {
        // Take the init of Hero class
        super.init(name: name, type: .healer, life: 125, damage: Staff.damage)
    }
    
    /// Description for the healer
    /// - return: String
    override func description() -> String {
        // If the healer is dead
        if self.isDead {
            // Take the description of Hero class
            return super.description()
        } else {
            // Print his onw description
            return "\(name) || \(type) -- \(life)/\(maxLife)HP -- healing by \(healing)"
        }
    }
    
    /// Heal the targeting hero
    /// - target: Hero
    func healHero(_ target: Hero) {
        // No overheal allowed
        guard target.life != target.maxLife else {
            print("You're wasted your turn, he's already full life...")
            return
        }
        
        // If heal is possible
        target.life += self.healing
        
        // If the life > maxLife after healing
        if target.life > target.maxLife {
            target.life = target.maxLife
        }
    }
}
