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
    // Life of the hero
    var life: Int
    
    // MARK: - Init
    init(name: String, type: HeroType) {
        self.name = name
        self.type = type
        
        //Calculated life according to the type
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
    }
    
    // MARK: - Methods
    // Description
    func description() {
        print("\(name) || \(type) with \(life) HP")
    }
}
