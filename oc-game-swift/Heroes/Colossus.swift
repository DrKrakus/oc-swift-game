//
//  Colossus.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 18/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

// Create the Colossus class
class Colossus: Hero {
    /// Init the Colossus subclass
    /// - name: String, Name of the colossus
    init(name: String) {
        // Take the init of Hero class
        super.init(name: name, type: .colossus, life: 150, weapon: Shield())
    }
    
}
