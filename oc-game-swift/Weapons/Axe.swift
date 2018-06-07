//
//  axe.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 18/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

/// Create the Axe class
class Axe: Weapon {
    
    // MARK: Methods
    
    /// Init from Weapon
    init() {
        super.init(damage: 20, healing: 0)
    }
}
