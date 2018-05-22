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
    
    // MARK: - Init
    init(name: String, type: HeroType) {
        self.name = name
        self.type = type
    }
}
