//
//  NameScreen.swift
//  GuessPo
//
//  Created by Ian Pacini on 02/09/24.
//

import SwiftUI

struct NameScreen: View {
    @Binding var navigationCoordinator: NavigationCoordinator
    
    @Binding var gameViewModel: GameViewModel
    
    var body: some View {
        if !gameViewModel.isLastPlayer {
            VStack {
                HStack {
                    Text("Passe o celular para:")
                        .font(.guessPoTitan(.title3))
                    Spacer()
                }
                
                Spacer()
                
                nameLabel(player: gameViewModel.currentPlayer == nil ? .init(name: "Jogador 1") : gameViewModel.currentPlayer)
                
                Spacer()
                
                PrimaryButton(title: "Eu sou o \(gameViewModel.getCurrentPlayerName())") {
                    guard let player = gameViewModel.currentPlayer else {
                        return
                    }
                    navigationCoordinator.appendToPath(.wordReveal)
                }
                .frame(height: 48)
                .padding(.horizontal, 17)
                .padding(.bottom, 20)
            }
            .foregroundStyle(.guessPoDarkBlue)
            .padding(.horizontal, 20)
        } else {
            StartGameScreen(navigationCoordinator: $navigationCoordinator)
        }
    }
    
    func nameLabel(player: Player?) -> some View {
        VStack {
            Image(systemName: "eyes")
                .font(.custom("default", size: 120))
            
            Text(player?.name ?? "Jogador")
                .font(.guessPoTitan(48))
        }
    }
}

#Preview {
    NameScreen(navigationCoordinator: .constant(.init()), gameViewModel: .constant(.init()))
}
