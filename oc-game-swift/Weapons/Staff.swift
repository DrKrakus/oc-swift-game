//
//  Staff.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 18/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

// Create the Staff class
class Staff: Weapon {
    // Init from Weapon
    init() {
        super.init(damage: 0, healing: 5)
    }
}
