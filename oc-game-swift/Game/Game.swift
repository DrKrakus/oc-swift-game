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
    // MARK: Properties
    // Array of players
    static var playerList: [Player] = []
    // The maximum of players per game
    static let maxPlayers = 2
    // Array of the heroes names
    static var heroesNames: [String] = []
    // Number of turns
    static var numberOfTurns = 1
    // Number of bonus chest
    static var bonusChest = 0
    // Playing player
    static var playingPlayer: Player {
        return Game.playerList[numberOfTurns % 2]
    }
    // Target player
    static var targetPlayer: Player {
        return Game.playerList[(numberOfTurns + 1) % 2]
    }
    
    // MARK: - Methods
    /// The starting menu
    static func start() {
        // Print the menu
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
                createPlayers()
            case "2":
                showCredits()
            default: // If not
                print("You have to choose 1 or 2 😅")
                // Replay the start menu
                start()
            }
        }
    }
    
    /// Create the players for the game
    static func createPlayers() {
        // While there is no all the players for the game
        while Game.playerList.count < Game.maxPlayers {
            
            // Print the message
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
        pickAHeroMenu()
    }
    
    /// The player have to choose heroes for his team
    static func pickAHeroMenu() {
        // Each player choose their heroes
        for player in Game.playerList {
            
            // While one player doesnt have all their heroes
            while player.heroTeam.count < player.maxHeroes {
                
                // Print the message
                print("-----------------------------------"
                    + "\n\(player.name) choose \(3 - player.heroTeam.count) heroes"
                    + "\n-----------------------------------"
                    + "\n 1. Fighter - Basic, strong, your best friend here"
                    + "\n 2. Healer - You should really think about him for your team"
                    + "\n 3. Dwarf - Fearless and powerfull, but weak too"
                    + "\n 4. Colossus - Tanky as fuck, but make less damage than your little sister")
                
                // Read the answer
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
    
    /// Fighting time, continues until there is a loser
    static func fightTime() {
        // There is a loser ?
        var thereIsALoser = false
        
        // Fight continues until a player lose
        while thereIsALoser == false {
            
            // Hero chosen
            var heroChosen: Hero
            // Target chosen
            var targetChosen: Hero
            
            // Playing player choose a hero of his team
            // Guard for a valid Hero
            guard let hero = playingPlayer.chooseHeroFromYourTeam() else {
                return
            }
            
            // Assign value to heroChosen
            heroChosen = hero
            
            // Random bonus chest
            isChestPop(heroChosen)
            
            // Playing player choose a target to attack or heal
            if heroChosen.type == .healer {
                // Guard for target selection
                guard let target = playingPlayer.chooseHeroToHeal() else {
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
            if let hero = heroChosen as? Healer {
                hero.healHero(targetChosen)
            } else {
                hero.attackHero(targetChosen)
            }
            
            // Checking for a loser
            playingPlayer.loserCheck()
            targetPlayer.loserCheck()
            
            // If a loser was found
            for player in Game.playerList {
                if player.isALoser == true {
                    print("-----------------------------------"
                        + "\nAll the heroes of \(player.name) are dead..."
                        + "\n💩 \(player.name) you lose! 💩")
                    thereIsALoser = true
                }
            }
            
            // Else, adding a turn and continue the fight
            numberOfTurns += 1
            
        }
        
        // When the fight is done
        showEndStats()
    }
    
    /// Random chest can pop
    private static func isChestPop(_ heroChoosen: Hero) {
        // Create a random number between 0 and 99
        let randomNumber = arc4random_uniform(99)
        
        // Check if the chest appears
        guard randomNumber <= 10 else {
            // If not, nothing append
            return
        }
        
        // Print the message
        print("-----------------------------------"
            + "\n 🎁  A bonus chest appears ! 🎁"
            + "\n-----------------------------------")
        
        // Add a chest to bonusChest count
        bonusChest += 1
        
        // Switch weapon
        heroChoosen.switchWeapon()
    }
    
    /// The stats of the game
    static func showEndStats() {
        // Take the winner from playerList
        let winner = Game.playerList.filter { $0.isALoser == false }
        
        // Print the message
        print("-----------------------------------"
            + "\n✋ THE GAME IS OVER 🤚"
            + "\n-----------------------------------"
            + "\nThe winner is : \(winner[0].name)"
            + "\n-----------------------------------"
            + "\nThis is his team after the fight:"
            + "\n\(winner[0].heroTeam[0].description())"
            + "\n\(winner[0].heroTeam[1].description())"
            + "\n\(winner[0].heroTeam[2].description())"
            + "\n-----------------------------------"
            + "\n This game was finished in \(numberOfTurns) turns"
            + "\n-----------------------------------"
            + "\n \(bonusChest) bonus chest(s) pop in during this game"
            + "\n-----------------------------------")
        
        // Return to the start menu
        start()
    }
    
    /// The credits for this awesome game !
    static func showCredits() {
        // Print the message
        print("This awesome game is developped by Jérôme Krakus !")
        
        // Return to the start menu
        Game.start()
    }
    
}
