//  Created by Ian Pacini on 04/09/24.
//

import Foundation

@Observable
class GameViewModel {
    
    var players: [Player] = []

    var currentPlayer: Player? {
        if !isLastPlayer && currentPlayerIndex < players.count{
            return players[currentPlayerIndex]
        }
        return nil
    }

    var imposter: Player?
    var isLastPlayer: Bool = false
    var selectedTheme: Category?
    var selectedWord: String?
    var showingAlert: Bool = false
    var showingAlertName: Bool = false
    var showingBackButtonAlert: Bool = false
    
    var newPlayerName: String = ""
    private var currentPlayerIndex: Int = 0
    
    func nextPlayer(){
        if currentPlayerIndex == players.count - 1 {
            isLastPlayer = true
        } else {
            currentPlayerIndex += 1
        }
    }
    
    func addPlayer() {
        let newPlayer = Player(name: newPlayerName)
        
        if newPlayer.name.count < 2 {
            self.showingAlertName = true
        } else {
            self.players.append(newPlayer)
            newPlayerName = ""
        }
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
    
    func generateWord(theme: Categories) -> String? {
        let wordsInTheme = JSONManager.getWordsFor(theme: theme)
        return wordsInTheme?.words.randomElement()
    }
    
    func randomizeImposter() -> Player? {
        return players.randomElement()
    }
    
    func selectTheme(theme: Category) {
        self.selectedTheme = theme
    }
    
    func getCurrentPlayerName() -> String {
        return currentPlayer?.name ?? "Jogador 1"
    }
    
    func playerIsImposter() -> Bool {
        guard let currentPlayer = currentPlayer, let imposter = imposter else {
            return false
        }
        return currentPlayer == imposter
    }
    
    func getWord() -> String {
        if playerIsImposter() {
            return "Impostor"
        }
        return selectedWord ?? "Palavra Secreta"
    }
    
    func getWordTextPreview() -> String {
        if playerIsImposter() {
            return "Se prepare, pois você é:"
        }
        return "A palavra da rodada é:"
    }
    
    func movePlayer(indices: IndexSet, newOffset: Int){
        players.move(fromOffsets: indices, toOffset: newOffset)
    }
    
///    Esta funçao vai chamar e checar todo o necessario para o jogo funcionar, incluindo:
///     - 2+ Jogadores
///     - 1 Jogador selecionado
///     - 1 Jogador impostor
///     - 1 tema selecionado
///     - 1 palavra selecionada no tema
///
///    Deverá jogar um erro caso algum desses processos falhe.
    func prepareGame() {
        //TODO: tratamento de erro
        
        if players.count <= 2 {
            // throw
            return
        }
        
        if self.selectedTheme == nil {
            // throw
            return
        }
        
        guard let imposter = self.randomizeImposter() else {
            // throw
            return
        }
        
        guard let selectedWord = self.generateWord(theme: selectedTheme!.themeEnum) else {
            // throw
            return
        }
        
        self.currentPlayerIndex = 0
        self.isLastPlayer = false
        self.imposter = imposter
        self.selectedWord = selectedWord
    }
}
