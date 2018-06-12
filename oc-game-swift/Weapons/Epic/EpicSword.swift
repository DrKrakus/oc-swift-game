//
//  EpicSword.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 28/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

/// Create the EpicSword class
class EpicSword: EpicWeapon {
    
    // MARK: Methods
    
    /// Init from EpicWeapon
    init(){
        super.init(damage: 15, healing: 0, maxDamage: 30, maxHealing: 0)
    }
}
