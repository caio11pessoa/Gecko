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

    var currentPlayer: Player? {
        if !isLastPlayer {
            return players[currentPlayerIndex]
        }
        return nil
    }

    var imposter: Player?
    
    var isLastPlayer: Bool = false

    var selectedTheme: Theme?
    var selectedWord: String?
    
    var newPlayerName: String = ""
    
    private var currentPlayerIndex: Int = 0
    
    func nextPlayer(){
        if currentPlayerIndex == players.count - 1{
            isLastPlayer = true
        } else {
            currentPlayerIndex += 1
            isLastPlayer = false
        }
    }
    
    func addPlayer() {
        let newPlayer = Player(name: newPlayerName)
        
        self.players.append(newPlayer)

        newPlayerName = ""
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
        
//        guard let currentPlayer = self.popPlayerList() else {
//            // throw
//            return
//        }
        
        guard let imposter = self.randomizeImposter() else {
            // throw
            return
        }
        
        guard let selectedWord = self.generateWord() else {
            // throw
            return
        }
        
        self.currentPlayerIndex = 0
        self.imposter = imposter
        self.selectedWord = selectedWord
    }
}
