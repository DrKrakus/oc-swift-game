//
//  Weapon.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 28/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

/// Create the Weapon class
public class Weapon {
    
    // MARK: Properties
    
    /// Damage
    var damage: Int
    /// Healing
    var healing: Int
    /// Status
    var isEpic: Bool {
        willSet {
            if self.healing != 0 {
                print("Your hero got an epic weapon, healing by \(self.healing) now!")
            } else {
                print("Your hero got an epic weapon, dealing \(self.damage) DMG now!")
            }
        }
    }
    
    // MARK: Methods
    
    /// Init
    init(damage: Int, healing: Int) {
        self.damage = damage
        self.healing = healing
        self.isEpic = false
    }
}
