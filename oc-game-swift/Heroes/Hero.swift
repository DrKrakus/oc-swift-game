//
//  Hero.swift
//  Soc-game-swift
//
//  Created by Jerome Krakus on 18/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

// MARK: - Create the Hero class
class Hero {
    // MARK: Properties
    // Name of the hero
    var name: String
    // Type of the hero
    var type: HeroType
    // Maximum of life
    let maxLife: Int
    // Life of the hero
    var life: Int {
        willSet {
            if newValue > life {
                print("\(self.name) is about to get heal")
            } else {
                print("\(self.name) is about to get attack")
            }
        }
        didSet {
            if oldValue > life {
                print("\(self.name) lose \(oldValue - life) HP, outch !")
            } else {
                 print("\(self.name) has been healed by \(life - oldValue)")
            }
        }
    }
    // Is still alive ?
    var isDead = false
    
    // MARK: - Init
    init(name: String, type: HeroType) {
        self.name = name
        self.type = type
        
        // Calculated life according to the type
        switch type {
        case .fighter:
            self.life = 100
        case .healer:
            self.life = 125
        case .dwarf:
            self.life = 75
        case .colossus:
            self.life = 150
        }
        
        // Maximum of life equal = life
        self.maxLife = life
    }
    
    // MARK: - Methods
    // Description
    func description() -> String {
        if isDead {
            return "\(name) || \(type) 💀 DIED IN COMBAT 💀"
        } else {
            return "\(name) || \(type) -- \(life)/\(maxLife)HP"
        }
    }
    
}
