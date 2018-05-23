//
//  Game.swift
//  oc-game-swift
//
//  Created by Jerome Krakus on 18/05/2018.
//  Copyright © 2018 Jerome Krakus. All rights reserved.
//

import Foundation

// MARK: - Create the Game class
class Game {
    // MARK: Properties
    // Array of players
    static var playerList: [Player] = []
    // The maximum of players per game
    static let maxPlayers = 2
    // Array of the heroes names
    static var heroesNames: [String] = []
    // Number of turns
    static var numberOfTurns = 1
    // Playing player
    static var playingPlayer:Player {
        return Game.playerList[numberOfTurns % 2]
    }
    // Target player
    static var targetPlayer:Player {
        return Game.playerList[(numberOfTurns + 1) % 2]
    }
    
    // MARK: - Methods
    // Start menu
    static func start() {
        
        print("\n----------------------"
            + "\nSWIFT TO THE DEATH"
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
                // Replay the start menu
                Game.start()
            }
        }
        
    }
    
    // Create players
    static func createPlayers() {
        // While there is no all the players for the game
        while Game.playerList.count < Game.maxPlayers {
            print("---------------------------------------------------"
                + "\nChoose your name player \(Game.playerList.count + 1)"
                + "\n---------------------------------------------------")
            // Read the name of player
            if let name = readLine(){
                if !name.isEmpty {
                    // If the name is not empty, create and add player to the game
                    Game.playerList.append(Player(name: name))
                } else {
                    // If empty
                    print("Dont be like that... Choose a name 🙃")
                }
            }
        }
        // When all the players are created, go to the hero selection
        Game.pickAHeroMenu()
        
    }
    
    // Hero selection menu
    static func pickAHeroMenu() {
        // Each player choose their heroes
        for player in Game.playerList {
            // While one player doesnt have all their heroes
            while player.heroTeam.count < player.maxHeroes {
                
                print("-----------------------------------"
                    + "\n\(player.name) choose \(3 - player.heroTeam.count) heroes"
                    + "\n-----------------------------------"
                    + "\n 1. Fighter - Basic, strong, your best friend here"
                    + "\n 2. Healer - You should really think about him for your team"
                    + "\n 3. Dwarf - Fearless and powerfull, but weak too"
                    + "\n 4. Colossus - Tanky as fuck, but make less damage than your little sister")
                
                // Check the awnser
                if let choice = readLine() {
                    // If the choice is not empty
                    if !choice.isEmpty {
                        // Read the choice
                        switch choice {
                        case "1":
                            // Create a Fighter
                            player.createHero(player: player, choice: HeroType.fighter)
                        case "2":
                            // Create a Healer
                            player.createHero(player: player, choice: HeroType.healer)
                        case "3":
                            // Create a Dwarf
                            player.createHero(player: player, choice: HeroType.dwarf)
                        case "4":
                            // Create a Colossus
                            player.createHero(player: player, choice: HeroType.colossus)
                        default:
                            // If the choice is not 1, 2, 3 or 4
                            print("Sorry, are you... 😬")
                        }
                    } else {
                        // If the choice is empty
                        print("Hey ! You must choose a hero!")
                    }
                }
            }
            
            // The player's team is ready
            print("The team of \(player.name) is ready!")
            
        }
        
        //Both teams are ready
        print("Both teams are ready, prepare to fight!")
        
        // Go to the fight
        fightTime()
        
        
    }
    
    // Fight time
    static func fightTime() {
        // There is a loser ?
        var loserOfFight = false
        
        // Fight continues until a player lose
        while loserOffight == false {
            // Hero chosen
            var heroChosen: Hero
            // Target chosen
            var targetChosen: Hero
            
            
            
            // Playing player choose a hero of his team
            // Guard for a valid Hero
            guard let hero = playingPlayer.chooseHeroFromYourTeam(for: playingPlayer) else {
                return
            }
            // Assign value to heroChosen
            heroChosen = hero
            
            
            
            // Playing player choose a target to attack or heal
            if heroChosen.type == .healer {
                // Guard for target selection
                guard let target = playingPlayer.chooseHeroToHeal(playingPlayer) else {
                    return
                }
                // Assign value to targetchosen
                targetChosen = target
            } else {
                // Guard for target selection
                guard let target = playingPlayer.chooseHeroToAttack(targetPlayer) else {
                    return
                }
                // Assign value to targetchosen
                targetChosen = target
            }
            
            
            
            // Attack or Heal phase according to the type of hero
            if let hero = heroChosen as? Fighter {
                hero.attackHero(targetChosen)
                // Print the result
                print("\(hero.name) attack \(targetChosen.name), doing \(hero.damage) dmg")
            } else if let hero = heroChosen as? Healer {
                hero.healHero(targetChosen)
                // Print the result
                print("\(hero.name) heal \(targetChosen.name), restauring \(hero.healing) life")
            } else if let hero = heroChosen as? Dwarf {
                hero.attackHero(targetChosen)
                // Print the result
                print("\(hero.name) attack \(targetChosen.name), doing \(hero.damage) dmg")
            } else if let hero = heroChosen as? Colossus {
                hero.attackHero(targetChosen)
                // Print the result
                print("\(hero.name) attack \(targetChosen.name), doing \(hero.damage) dmg")
            } else {
                print("WTF ??")
            }
            
            // There is a loser ?

            
            // If a player has 3 heroes dead
          
            
            // Adding a turn
            numberOfTurns += 1
            
        }
        
        
    }
    
    // Show credits
    static func showCredits() {
        print("This awesome game is developped by Jérôme Krakus !")
        // Return to the start menu
        Game.start()
    }
    
}
