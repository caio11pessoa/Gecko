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
    
    var selectedTheme: Theme?
    var selectedWord: String?
    
    func addPlayer(playerName: String) {
        let newPlayer = Player(name: playerName)
        
        self.players.append(newPlayer)
    }
    
    func popPlayerList() -> Player? {
        players.popLast()
    }
    
    func selectTheme(theme: Theme) {
        self.selectedTheme = theme
    }
    
    func generateWord() /* Necessario tratamento de erro */ {
        guard let selectedTheme = self.selectedTheme else {
            
        }
        guard let selectedWord = selectedTheme.wordList.randomElement() else {
            
        }
        self.selectedWord = selectedWord
    }
    
}
