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
    
    // MARK: - Properties
    // Player name
    var name: String
    // Player's team
    var heroTeam: [Hero] = []
    // Max heroes per team
    let maxHeroes = 3
    // Is the loser
    var isALoser = false
    
    // MARK: - Methods
    /// Init
    /// - name: String. Create a player with the name chosen
    init(name: String) {
        self.name = name
    }
    
    /// Create hero
    /// - player: Player. Adding the hero to the player heroTeam array
    /// - choice: HeroType. Create and adding the type of hero the player choose
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
                        player.heroTeam.append(Fighter(name: name))
                    case .healer:
                        // Add a Healer
                        player.heroTeam.append(Healer(name: name))
                    case .dwarf:
                        // Add a Dwarf
                        player.heroTeam.append(Dwarf(name: name))
                    case .colossus:
                        // Add a Colossus
                        player.heroTeam.append(Colossus(name: name))
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
    
    /// Choosing a hero
    /// - Player have to choose a hero to fight with this round
    /// - return: The selected hero
    func chooseHeroFromYourTeam() -> Hero? {
        // Hero is choose ?
        var heroChosen = false
        // While not
        while heroChosen == false {
            // Print the message
            print("-----------------------------------"
                + "\n\(self.name), it's your turn. Choose a hero to fight with"
                + "\n-----------------------------------"
                + "\n1. \(self.heroTeam[0].description())"
                + "\n2. \(self.heroTeam[1].description())"
                + "\n3. \(self.heroTeam[2].description())")
            // Choose a hero, and check if its ok
            if let hero = chooseHero(self) {
                heroChosen = true
                return hero
            } else {
                // If the selection of hero fails
                print("You can't choose a hero...")
                return nil
            }
        }
    }
    
    /// Choosing a hero
    /// - player: Player. Have to choose a hero to attack
    /// - return: The selected hero
    func chooseHeroToAttack(_ player: Player) -> Hero? {
        // Hero is choose ?
        var heroChosen = false
        // While not
        while heroChosen == false {
            // Print the message
            print("-----------------------------------"
                + "\nChoose a target from the team of \(player.name)"
                + "\n-----------------------------------"
                + "\n1. \(player.heroTeam[0].description())"
                + "\n2. \(player.heroTeam[1].description())"
                + "\n3. \(player.heroTeam[2].description())")
            
            // Choose a hero
            if let targetHero = chooseHero(player) {
                heroChosen = true
                return targetHero
            } else {
                // If the selection of hero fails
                print("You can't choose a hero...")
                return nil
            }
        }
    }
    
    /// Choosing a hero
    /// - Player have to choose a hero to heal with the healer
    /// - return: The selected hero
    func chooseHeroToHeal() -> Hero? {
        // Hero is choose ?
        var heroChosen = false
        // While not
        while heroChosen == false {
            // Print the message
            print("-----------------------------------"
                + "\n\(self.name), choose the hero to heal"
                + "\n-----------------------------------"
                + "\n1. \(self.heroTeam[0].description())"
                + "\n2. \(self.heroTeam[1].description())"
                + "\n3. \(self.heroTeam[2].description())")
            
            // Choose a hero
            if let heroToHeal = chooseHero(self) {
                heroChosen = true
                return heroToHeal
            } else {
                // If the selection of hero fails
                print("You can't choose a hero...")
                return nil
            }
        }
    }
    
    /// Choosing a hero
    /// - player: Player. Have to choose a hero
    /// - return: The selected hero
    private func chooseHero(_ player: Player) -> Hero? {
        // Read the choice
        if let choice = readLine() {
            // If choice is not empty
            guard !choice.isEmpty else {
                print("you have to choose a hero")
                return nil
            }
            // Try to cast the String to Int
            guard let numberChoice = Int(choice) else {
                print("I dont understand your choice...")
                return nil
            }
            // If numberChoice is not out of range
            guard numberChoice <= maxHeroes, numberChoice > 0 else {
                print("You only have \(maxHeroes) heroes")
                return nil
            }
            // Check the status of the selected heroe
            guard heroIsAlive(player.heroTeam[numberChoice - 1]) else {
                print("you have to choose a hero")
                return nil
            }
            // All is good
            return player.heroTeam[numberChoice - 1]
        }
        // If the readLine fails
        print("I can't ask for your choice...")
        return nil
    }
    
    /// Check the life of hero
    /// - hero: Hero. Hero the player want to fight / choose
    /// - return: Bool. If is dead or not
    private func heroIsAlive(_ hero: Hero) -> Bool {
        if hero.isDead == false {
            // If is alive
            return true
        } else {
            // If is dead
            print("This hero is dead...")
            return false
        }
        
    }

    /// Check for dead heroes
    /// - After each turns, check if a player lose the fight
    func loserCheck() {
        // Heroes count
        var deadHeroes = 0
        // Check heroes status
        for hero in self.heroTeam{
            // If dead
            if hero.isDead {
                // Add to deadHeroes
                deadHeroes += 1
            }
        }
        // There is a loser ?
        if deadHeroes == maxHeroes {
            // If a player has 3 heroes dead
            self.isALoser = true
        }
    }
}
