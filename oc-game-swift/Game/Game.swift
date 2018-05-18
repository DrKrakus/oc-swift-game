//
//  Game.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 18/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

// Create the Game class
class Game {
    static var playerList = [Player]()
    
    // Welcome Menu
    static func start() {
        print("SWIFT TO THE DEATH"
            + "\n----------------------"
            + "\n"
            + "\n Select an option"
            + "\n"
            + "\n1. Start New Game"
            + "\n2. Credits")
        // If options 1 or 2 are choosen
        if let line = readLine(){
            switch line{
            case "1": // Move on to the player creation
                Game.createPlayers()
            case "2":
                Game.showCredits()
            default: // If not
                print("You have to choose 1 or 2 😅")
                Game.start()
            }
        }
        
    }
    
    // Show credits
    static func showCredits() {
        print("This awesome game is developped by Jérôme Krakus !")
    }
    
    // Create players
    static func createPlayers() {
        // While there is no 2 players for the game
        while Game.playerList.count < 2 {
            print("---------------------------------------------------"
                + "\nChoose your name player \(Game.playerList.count + 1)"
                + "\n---------------------------------------------------")
            // Read the name of player
            if let name = readLine(){
                if name != "" {
                    // If the name is not empty, create and add player to the game
                    Game.playerList.append(Player(playerName: name))
                } else {
                    // If not
                    print("Dont be like that... Choose a name 🙃")
                }
            }
        }
        // When 2 players are created
        pickAHeroMenu()
        
    }
    
    // Mark : - Hero selection
    static func pickAHeroMenu() {
        // Each player choose 3 heroes
        for player in Game.playerList {
            while player.heroTeam.count < 3 {
                print("\(player.playerName) choose \(3 - player.heroTeam.count) heroes"
                    + "\n 1. Fighter - Basic, strong, your best friend here"
                    + "\n 2. Healer - You should really think about him for your team"
                    + "\n 3. Dwarf - Fearless and powerfull, but weak too"
                    + "\n 4. Colossus - Tanky as fuck, but make less damage than your little sister")
                // Check the awnser
                if let choice = readLine() {
                    if choice != "" {
                        switch choice {
                        case "1":
                            Game.createHero(player: player, choice: "Fighter")
                        case "2":
                            Game.createHero(player: player, choice: "Healer")
                        case "3":
                            Game.createHero(player: player, choice: "Dwarf")
                        case "4":
                            Game.createHero(player: player, choice: "Colossus")
                        default:
                            print("Sorry, are you... Retarded? 😬")
                        }
                    } else {
                        print("Hey ! You must choose a hero!")
                    }
                }
            }
            
            print("The teams are ready to fight !")
            
        }
    }
    
    static func createHero(player: Player, choice: String) {
        print("Name your \(choice)")
        if let name = readLine(){
            if name != "" {
                print("Your \(choice) = \(name)")
            } else {
                print("Srsly? Everytime? Choose a name...")
            }
        }
        Game.pickAHeroMenu()
    }
    
}
