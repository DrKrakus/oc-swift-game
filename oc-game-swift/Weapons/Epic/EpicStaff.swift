//
//  EpicStaff.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 28/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

/// Create the EpicStaff class
class EpicStaff: EpicWeapon {
    
    // MARK: Methods
    
    /// Init from EpicWeapon
    init(){
        super.init(damage: 0, healing: 7, maxDamage: 0, maxHealing: 15)
    }
}
