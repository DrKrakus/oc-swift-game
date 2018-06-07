//
//  Hero.swift
//  Soc-game-swift
//
//  Created by Jerome Krakus on 18/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

/// Create the Hero class
class Hero {
    
    // MARK: Properties
    
    /// Name of the hero
    var name: String
    /// Type of the hero
    var type: HeroType
    /// Weapon
    var weapon: Weapon
    /// Maximum of life
    let maxLife: Int
    /// Life of the hero
    var life: Int {
        // Before the life change
        willSet {
            if newValue > life {
                print("\(self.name) is about to get heal")
            } else {
                print("\(self.name) is about to get attack")
            }
        }
        // After the life change
        didSet {
            if oldValue > life {
                print("\(self.name) lose \(oldValue - life) HP, outch !")
            } else {
                 print("\(self.name) has been healed by \(life - oldValue)")
            }
        }
    }
    /// Is still alive ?
    var isDead = false
    
    // MARK: - Methods
    
    /// Init the Hero class
    /// - name: String, The hero's name
    /// - type: HeroType, The type of hero
    /// - life: Int, The hero's life, according to the type
    /// - damage: Int, The hero's damage, according to the type
    init(name: String, type: HeroType, life: Int, weapon: Weapon) {
        self.name = name
        self.type = type
        self.life = life
        self.maxLife = life
        self.weapon = weapon
    }
    
    /// Description of the hero
    /// - return: String
    func description() -> String {
        if isDead {
            return "\(name) || \(type) 💀 DIED IN COMBAT 💀"
        } else {
            return "\(name) || \(type) -- \(life)/\(maxLife)HP -- doing \(weapon.damage) DMG"
        }
    }
    
    /// Attacking the hero whos targeting
    /// - target: Hero
    func attackHero(_ target: Hero) {
        // Amount of damage
        target.life -= self.weapon.damage
        
        // If the target is dead
        if target.life <= 0 {
            target.isDead = true
        }
    }
    
    /// Switching weapon from the random bonus chest
    func switchWeapon() {
        // Check if the hero weapon isEpic
        if self.weapon.isEpic {
            // Check the type
            if let epicWeapon = self.weapon as? EpicWeapon {
                // Buff weapon
                epicWeapon.buffHisStats()
            }
        } else {
            // Or switch the current weapon for the epic one
            // Check the hero's type
            if let hero = self as? Healer {
                // Switch weapon
                hero.weapon = EpicStaff()
            } else if let hero = self as? Fighter {
                // Switch weapon
                hero.weapon = EpicSword()
            } else if let hero = self as? Dwarf {
                // Switch weapon
                hero.weapon = EpicAxe()
            } else if let hero = self as? Colossus {
                // Switch weapon
                hero.weapon = EpicShield()
            }
        }
    }
}
