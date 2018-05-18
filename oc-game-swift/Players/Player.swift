//
//  Player.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 18/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

// Create the Player class
class Player {
    var playerName: String
    var heroTeam = [Hero]()
    
    init(playerName: String) {
        self.playerName = playerName
    }
}
