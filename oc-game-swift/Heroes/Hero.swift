//
//  Hero.swift
//  Soc-game-swift
//
//  Created by Jerome Krakus on 18/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

// Create the Hero class
class Hero {
    var heroName: String
    var heroType: HeroType
    
    init(heroName: String, heroType: HeroType) {
        self.heroName = heroName
        self.heroType = heroType
    }
}
