//
//  WordReveal.swift
//  GuessPo
//
//  Created by Caio de Almeida Pessoa on 02/09/24.
//

import SwiftUI

struct WordRevealScreen: View {
    @Binding var navigationCoordinator: NavigationCoordinator

    @Binding var gameViewModel: GameViewModel
    
    var playerIsImposter: Bool {
        gameViewModel.currentPlayer == gameViewModel.imposter
    }

    var word: String {
        if playerIsImposter {
            return "Impostor"
        }
        return gameViewModel.selectedWord!
    }

    var wordTextPreview: String {
        if playerIsImposter {
            return "Se prepare, pois você é:"
        }
        return "A palavra da rodada é:"
        
    }
    var body: some View {

        VStack(spacing: 0) {

            Spacer()

            Text(gameViewModel.currentPlayer?.name ?? "Começando!")
                .font(.guessPoTitan(48))
                .foregroundStyle(.guessPoDarkBlue)
            
            Text(wordTextPreview)
                .font(.system(size: 16))
                .bold()
                .fontDesign(.rounded)
                .padding(.top, 18)
            
            WordRevealTag(title: word, isImpostor: playerIsImposter)
                .frame(height: 54)
                .padding(.top, 18)
            
            textContent
                .font(.system(size: 16))
                .bold()
                .fontDesign(.rounded)
                .padding(.top, 32)
            
            Spacer()
            
            PrimaryButton(title: "Entendido!") {
                gameViewModel.currentPlayerIndex += 1
                _ = navigationCoordinator.popPath()
            }
            .frame(height: 48)
            .padding(.bottom, 32)

        }
        .padding(.horizontal, 38)
        .ignoresSafeArea()

    }
    
    var textContent: some View {

        Group {

            if playerIsImposter {
                Text("O tema da rodada é ")
                +
                Text(gameViewModel.selectedTheme!.themeName)
                    .foregroundStyle(.blue)
                +
                Text(", agora é só fingir que sabe qual é a palavra.")
            } else {
                Text("Todo mundo vai receber essa mesma palavra, exceto o ")
                +
                Text("impostor.")
                    .foregroundStyle(.guessPoDarkRed)

            }

        }
    }
}

#Preview {
    WordRevealScreen(navigationCoordinator: .constant(.init()), gameViewModel: .constant(.init()))
}
