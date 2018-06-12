//
//  EpicWeapon.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 28/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

/// Create the Weapon class
class EpicWeapon: Weapon {
    
    // MARK: Properties
    
    // Epic weapon can be buffed from random chest
    /// Max damage form buff
    let maxDamage: Int
    /// Max heal from buff
    let maxHealing: Int
    
    // MARK: Methods
    
    /// Init from Weapon
    init(damage: Int, healing: Int, maxDamage: Int, maxHealing: Int) {
        self.maxDamage = maxDamage
        self.maxHealing = maxHealing
        super.init(damage: damage, healing: healing)
        self.isEpic = true
    }
    
    /// Buff himself from random chest
    func buffHisStats(){
        // Check the weapon
        if self is EpicStaff {
            // If its already at maxHeal
            guard healing < maxHealing else {
                print("Your weapon is already at his max healing power, it can't be buff")
                return
            }
            // If not, buff the heal
            self.healing += 2
            print("Your epic weapon is buffed ! You heal by \(self.healing) now!")
        } else {
            // If its already at maxDamage
            guard damage < maxDamage else {
                print("Your weapon is already at his max damage dealing, it can't be buff")
                return
            }
            // If not, buff the damage
            self.damage += 5
            print("Your epic weapon is buffed ! You deal \(self.damage) DMG now!")
        }
    }
}
