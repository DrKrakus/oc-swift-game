//
//  Player.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 18/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

// MARK: - Create the Player class
class Player {
    // MARK: - Properties
    // Player name
    var name: String
    // Player's team
    var heroTeam: [Hero] = []
    // Max heroes per team
    let maxHeroes = 3
    // Count of dead heroes
    var deadHeroes = 0
    
    // MARK: - Init
    init(name: String) {
        self.name = name
    }
    
    // MARK: - Methods
    // Create a hero
    func createHero(player: Player, choice: HeroType) {
        // A check for hero creation
        var heroWasCreated = false
        // While the picked hero is not create
        while heroWasCreated == false {
            // Asking for name
            print("-----------------------------------"
                + "\nName your \(choice)"
                + "\n-----------------------------------")
            // Read the answer
            if let name = readLine(){
                // Check if the name is already taken
                if Game.heroesNames.contains(name) {
                    print("This name is already taken")
                } else if name.isEmpty {
                    // Check if the name is empty
                    print("Srsly? Everytime? Choose a name...")
                } else { // If not
                    // Switch for the type of hero to add
                    switch choice {
                    case .fighter:
                        // Add a Fighter
                        player.heroTeam.append(Fighter(name: name, type: .fighter))
                    case .healer:
                        // Add a Healer
                        player.heroTeam.append(Healer(name: name, type: .healer))
                    case .dwarf:
                        // Add a Dwarf
                        player.heroTeam.append(Dwarf(name: name, type: .dwarf))
                    case .colossus:
                        // Add a Colossus
                        player.heroTeam.append(Colossus(name: name, type: .colossus))
                    }
                    // Print that all is good
                    print("Your \(choice) \(name) has been added to your team")
                    // Add the name to the array of heroes names
                    Game.heroesNames.append(name)
                    // Turn the check on true
                    heroWasCreated = true
                }
            }
        }
    }
    
    // Choose a hero for fight this turn
    func chooseHeroFromYourTeam(for player: Player) -> Hero? {
        // Hero is choose ?
        var heroChosen = false
        
        while heroChosen == false {
            // Print the message
            print("-----------------------------------"
                + "\n\(player.name), it's your turn. Choose a hero to fight with"
                + "\n-----------------------------------"
                + "\n1. \(player.heroTeam[0].description())"
                + "\n2. \(player.heroTeam[1].description())"
                + "\n3. \(player.heroTeam[2].description())")
            
            // Choose a hero
            if let hero = chooseHero(player: player) {
                heroChosen = true
                return hero
            }
        }
        
    }
    
    // Choose an ennemy hero to attack
    func chooseHeroToAttack(_ player: Player) -> Hero? {
        // Hero is choose ?
        var heroChosen = false
        
        while heroChosen == false {
            // Print the message
            print("-----------------------------------"
                + "\nChoose a target from the team of \(player.name)"
                + "\n-----------------------------------"
                + "\n1. \(player.heroTeam[0].description())"
                + "\n2. \(player.heroTeam[1].description())"
                + "\n3. \(player.heroTeam[2].description())")
            
            // Choose a hero
            if let targetHero = chooseHero(player: player) {
                heroChosen = true
                return targetHero
            }
        }
        
    }
    
    // Choose a hero to heal
    func chooseHeroToHeal(_ player: Player) -> Hero? {
        // Hero is choose ?
        var heroChosen = false
        
        while heroChosen == false {
            // Print the message
            print("-----------------------------------"
                + "\n\(player.name), choose the hero to heal"
                + "\n-----------------------------------"
                + "\n1. \(player.heroTeam[0].description())"
                + "\n2. \(player.heroTeam[1].description())"
                + "\n3. \(player.heroTeam[2].description())")
            
            // Choose a hero
            if let heroToHeal = chooseHero(player: player) {
                heroChosen = true
                return heroToHeal
            }
        }
    }
    
    // Choosing a hero
    private func chooseHero(player: Player) -> Hero? {
        // Read the choice
        if let choice = readLine() {
            // If choice is not empty
            if !choice.isEmpty {
                switch choice {
                case "1":
                    if heroIsAlive(player.heroTeam[0]) {
                        return player.heroTeam[0]
                    }
                case "2":
                    if heroIsAlive(player.heroTeam[1]) {
                        return player.heroTeam[1]
                    }
                case "3":
                    if heroIsAlive(player.heroTeam[2]) {
                        return player.heroTeam[2]
                    }
                default:
                    // If choice is not good
                    print("You only have 3 heroes, you must choose 1, 2 or 3")
                }
            } else {
                // If choice is emplty
                print("you have to choose a hero")
            }
        }
        // If the readLine fails
        return nil
    }
    
    // Check the life of hero
    private func heroIsAlive(_ hero: Hero) -> Bool {
        if hero.isAlive {
            return true
        } else {
            // If not
            print("This hero is dead...")
            return false
        }
        
    }
    
}
