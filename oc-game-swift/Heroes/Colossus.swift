//
//  Colossus.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 18/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

// MARK: - Colossus class
class Colossus: Hero {
    
    // Init
    init(name: String) {
        super.init(name: name, type: .colossus, life: 150, damage: Shield.damage)
    }
    
}
