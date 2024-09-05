//
//  GameViewModel.swift
//  GuessPo
//
//  Created by Ian Pacini on 04/09/24.
//

import Foundation

@Observable
class GameViewModel {
    
    var players: [Player] = []
    
    var currentPlayer: Player?
    var imposter: Player?
    
    var selectedTheme: Theme?
    var selectedWord: String?
    
    
    func addPlayer(playerName: String) {
        let newPlayer = Player(name: playerName)
        
        self.players.append(newPlayer)
    }
    func deletePlayer(_ player: Player) {

        guard let playerIndex: Int = players.firstIndex(of: player) else {
            return
        }
        self.players.remove(at: playerIndex)

    }
    
    func popPlayerList() -> Player? {
        players.popLast()
    }
    
    func generateWord() -> String? {
        return self.selectedTheme?.wordList.randomElement()
    }
    
    func randomizeImposter() -> Player? {
        return players.randomElement()
    }
    
    func selectTheme(theme: Theme) {
        self.selectedTheme = theme
    }
    
    func prepareGame() /* Necessario tratamento de erro */ {
        /*
        Esta funçao vai chamar e checar todo o necessario para o jogo funcionar, incluindo:
         - 2+ Jogadores
         - 1 Jogador selecionado
         - 1 Jogador impostor
         - 1 tema selecionado
         - 1 palavra selecionada no tema
            
        Deverá jogar um erro caso algum desses processos falhe.
        */
        
        if players.count <= 2 {
            // throw
            return
        }
        
        if self.selectedTheme == nil {
            // throw
            return
        }
        
        guard let currentPlayer = self.popPlayerList() else {
            // throw
            return
        }
        
        guard let imposter = self.randomizeImposter() else {
            // throw
            return
        }
        
        guard let selectedWord = self.generateWord() else {
            // throw
            return
        }
        
        self.currentPlayer = currentPlayer
        self.imposter = imposter
        self.selectedWord = selectedWord
    }
}
