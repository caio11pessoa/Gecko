//
//  WordAtributionViewModel.swift
//  GuessPo
//
//  Created by Ian Pacini on 04/09/24.
//

import Foundation

@Observable
class WordAtributionViewModel {
    
    var players: [Player] = []
    var currentPlayer: Player
    
    var impostor: Player
    
    func addPlayer(playerName: String) {
        let newPlayer = Player(name: playerName)
        
        self.players.append(newPlayer)
    }
    
    func popPlayerList() -> Player? {
        players.popLast()
    }
    
    func wordSelection()
    
}
