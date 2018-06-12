//
//  EpicShield.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 28/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

/// Create the EpicShield class
class EpicShield: EpicWeapon {
    
    // MARK: Methods
    
    /// Init from EpicWeapon
    init(){
        super.init(damage: 10, healing: 0, maxDamage: 25, maxHealing: 0)
    }
}
