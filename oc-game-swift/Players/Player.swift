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
    // Hero chosen
    var heroChosen: Hero?
    // Target chosen
    var targetChosen: Hero?
    
    // MARK: - Methods
    /// Init of Player class
    /// - name: String, Create a player with the name chosen
    init(name: String) {
        self.name = name
    }
    
    /// Adding the chosen hero to the player heroTeam array
    /// - player: Player, The one who chose the hero
    /// - choice: HeroType, The choice of the player
    func createHero(player: Player, choice: HeroType) {
        // A check for hero creation
        var heroWasCreated = false
        // While the picked hero is not create
        while heroWasCreated == false {
            // Asking for name
            print("""
                -----------------------------------
                Name your \(choice)
                -----------------------------------
                """)
            // Read the answer
            if let name = readLine(){
                // Check if the name is already taken
                if Game.heroesNames.contains(name) {
                    print("This name is already taken")
                } else if name.isEmpty{
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
    /// - Player have to choose a hero of his team
    /// - return: The selected hero
    func chooseHeroFromYourTeam() -> Hero? {
        // While not
        while true {
            // Print this message if no hero has been chosen
            if heroChosen == nil {
                print("""
                    -----------------------------------
                    \(self.name), it's your turn. Choose a hero to fight with
                    -----------------------------------
                    """)
            } else {
                // If the player has already choose a hero
                print("""
                    -----------------------------------
                    \(self.name), Choose a hero to heal from your team
                    -----------------------------------
                    """)
            }
            
            // Then print heroes description
            describeHeroes(self)
            
            // Choose a hero, and check if its ok
            if let hero = chooseHero(self) {
                return hero
            }
        }
    }
    
    
    /// Player have to choose a hero to attack
    /// - player: Player, The one who chose
    /// - return: Hero?, The selected hero
    func chooseHeroToAttack(_ player: Player) -> Hero? {
        // Hero is choose ?
        var playerChoice = false
        // While not
        while playerChoice == false {
            // Print the message
            print("""
                -----------------------------------
                Choose a target from the team of \(player.name)
                -----------------------------------"
                """)
            
            // Then print heroes description
            describeHeroes(player)
            
            // Choose a hero
            if let targetHero = chooseHero(player) {
                playerChoice = true
                return targetHero
            }
        }
    }
    
    /// Choosing a hero from heroTeam array
    /// - player: Player, The one who chose
    /// - return: Hero?, The selected hero
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
    
    /// Check the life of hero chosen
    /// - hero: Hero. Hero chosen
    /// - return: Bool. If is dead or not
    private func heroIsAlive(_ hero: Hero) -> Bool {
        if hero.isDead {
            // If dead, print the message
            print("This hero is dead...")
            return false
        }
        // If alive
        return true
    }
    
    /// Check for dead heroes in the player team
    func loserCheck() {
        // Checking deadHeroes
        let deadHeroes = self.heroTeam.filter { $0.isDead }
        // There is a loser ?
        if deadHeroes.count == maxHeroes {
            // If a player has 3 heroes dead
            self.isALoser = true
        }
    }
    
    /// Description of heroes in heroTeam
    private func describeHeroes(_ player: Player) {
        // Number for helping player to choose
        var numberForChoice = 1
        // For each hero in heroTeam
        for hero in player.heroTeam {
            // Print the message
            print("\(numberForChoice) \(hero.description())")
            numberForChoice += 1
        }
    }
}
