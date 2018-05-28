//
//  EpicAxe.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 28/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

// Create the EpicAxe class
class EpicAxe: EpicWeapon {
    // Init from EpicWeapon
    init(){
        super.init(damage: 25, healing: 0, maxDamage: 40, maxHealing: 0)
    }
}
