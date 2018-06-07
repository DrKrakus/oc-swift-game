//
//  Fighter.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 18/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

/// Create the Fighter class
class Fighter: Hero {
    
    // MARK: - Methods
    
    /// Init the Fighter subclass
    /// - name: String, Name of the fighter
    init(name: String) {
        // Take the init of Hero class
        super.init(name: name, type: .fighter, life: 100, weapon: Sword())
    }
}
