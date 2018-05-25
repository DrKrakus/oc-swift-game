//
//  Dwarf.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 18/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

// MARK: - Dwarf class
class Dwarf: Hero {
    
    // Init
    init(name: String) {
        super.init(name: name, type: .dwarf, life: 75, damage: Axe.damage)
    }
    
}

