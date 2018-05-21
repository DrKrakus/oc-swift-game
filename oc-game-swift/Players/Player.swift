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
    // Player name
    var playerName: String
    // Player's team
    var heroTeam = [Hero]()
    
    // Init with name
    init(playerName: String) {
        self.playerName = playerName
    }
    
    // Create a hero
    static func createHero(player: Player, choice: HeroType) {
        // A check for hero creation
        var heroWasCreated = false
        // While the picked hero is not create
        while heroWasCreated == false {
            // Asking for name
            print("Name your \(choice)")
            // Read the answer
            if let name = readLine(){
                // If the name is not empty, add the hero to team
                if name != "" {
                    // Switch for the type of hero
                    switch choice {
                    case .fighter:
                        player.heroTeam.append(Fighter(heroName: name, heroType: .fighter))
                    case .healer:
                        player.heroTeam.append(Healer(heroName: name, heroType: .healer))
                    case .dwarf:
                        player.heroTeam.append(Dwarf(heroName: name, heroType: .dwarf))
                    case .colossus:
                        player.heroTeam.append(Colossus(heroName: name, heroType: .colossus))
                    }
                    // Print that all is good
                    print("The \(choice) \(name) has been added to the team of \(player.playerName)")
                    // Turn the check on true
                    heroWasCreated = true
                } else {
                    // If the name is empty
                    print("Srsly? Everytime? Choose a name...")
                }
            }
        }
    }
    
    
    
    
}
