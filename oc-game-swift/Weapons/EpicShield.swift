//
//  EpicShield.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 28/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

// Create the EpicShield class
class EpicShield: EpicWeapon {
    // Init from EpicWeapon
    init(){
        super.init(damage: 5, healing: 0, maxDamage: 20, maxHealing: 0)
    }
}
