//
//  Dwarf.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 18/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

/// Create the Dwarf class
class Dwarf: Hero {
    
    // MARK: - Methods
    
    //// Init the Dwarf subclass
    /// - name: String, Name of the dwarf
    init(name: String) {
        // Take the init of Hero class
        super.init(name: name, type: .dwarf, life: 75, weapon: Axe())
    }
}

