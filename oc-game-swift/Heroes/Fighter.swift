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
    
    // Init
    init(name: String) {
        super.init(name: name, type: .fighter, life: 100, damage: Sword.damage)
    }
    
}
