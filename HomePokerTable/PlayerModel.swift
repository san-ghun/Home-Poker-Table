//
//  PlayerModel.swift
//  HomePokerTable
//
//  Created by Sanghun Park on 18.05.22.
//

import Foundation

class PlayerModel {
    
    func getPlayers(nop numberOfPlayers: Int, asset assetOfPlayers: Int) -> [Player] {
        
        // Declare an empty array
        var generatedPlayers: [Player] = []
        
        // Generate N number of players
        for i in 1...numberOfPlayers {
            
            // Create new player object
            let player = Player()
            
            // Set data of player
            player.number = i
            player.asset = assetOfPlayers
            player.isActive = true
            
            // Add player to the array
            generatedPlayers.append(player)
        }
        
        // Return the array
        return generatedPlayers
    }
    
}
