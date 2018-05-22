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
    
    // MARK: - Init
    init(name: String) {
        self.name = name
    }
    
    // MARK: - Methods
    // Create a hero
    static func createHero(player: Player, choice: HeroType) {
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
    func chooseHeroToPlay(for player: Player) -> Hero? {
        // Heroes shortcut
        let hero1 = player.heroTeam[0]
        let hero2 = player.heroTeam[1]
        let hero3 = player.heroTeam[2]
        
        // Print the message
        print("-----------------------------------"
            + "\n\(player.name), it's your turn. Choose a hero to fight with"
            + "\n-----------------------------------"
            + "\n1. \(hero1.description())"
            + "\n2. \(hero2.description())"
            + "\n3. \(hero3.description())")
        
        //Read choice
        if let choice = readLine() {
            // If choice is not empty
            if !choice.isEmpty {
                switch choice {
                case "1":
                    if heroIsAlive(hero1) {
                        return hero1
                    }
                case "2":
                    if heroIsAlive(hero2) {
                        return hero2
                    }
                case "3":
                    if heroIsAlive(hero3) {
                        return hero3
                    }
                default:
                    // If choice is not good
                    print("You only have 3 heroes, you must choose 1, 2 or 3")
                }
            } else {
                // If choice is emplty
                print("It's too late, you have to fight now !")
            }
        }
        // If the readLine fails
        return nil
    }
    
    // Choose an ennemy hero to attack
    func chooseHeroToAttack(for player: Player) -> Hero? {
        
        
    }
    
    
    func heroAttackHero(by: Hero, target: Hero) {
    
    }
    
    // Check the status of heroes
    func heroIsAlive(_ hero: Hero) -> Bool {
        if hero.isAlive {
            // Print this
            print("\(hero.name) is glad to honor this fight")
            // Return true
            return true
        } else {
            // If not
            print("This hero is dead...")
            return false
        }
        
    }
    
}
