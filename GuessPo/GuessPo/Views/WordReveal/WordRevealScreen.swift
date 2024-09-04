//
//  WordReveal.swift
//  GuessPo
//
//  Created by Caio de Almeida Pessoa on 02/09/24.
//

import SwiftUI

struct WordRevealScreen: View {
    @Binding var navigationCoordinator: NavigationCoordinator

    var player: Player = .init(name: "Pedro", role: .imposter)

    var tema: String = "Famosos"

    var word: String {
        if player.role == .imposter {
            return "Impostor"
        }
        return "word"
    }

    var wordTextPreview: String {
        if player.role == .imposter {
            return "Se prepare, pois você é:"
        }
        return "A palavra da rodada é:"
        
    }
    var body: some View {

        VStack(spacing: 0) {

            Spacer()

            Text(player.name)
                .font(.guessPoTitan(48))
                .foregroundStyle(.guessPoDarkBlue)
            
            Text(wordTextPreview)
                .font(.system(size: 16))
                .bold()
                .fontDesign(.rounded)
                .padding(.top, 18)
            
            WordRevealTag(title: word, isImpostor: player.role == .imposter)
                .frame(height: 54)
                .padding(.top, 18)
            
            textContent
                .font(.system(size: 16))
                .bold()
                .fontDesign(.rounded)
                .padding(.top, 32)
            
            Spacer()
            
            PrimaryButton(title: "Entendido!") {
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

            switch player.role {
            case .imposter:

                Text("O tema da rodada é ")
                +
                Text(tema)
                    .foregroundStyle(.blue)
                +
                Text(", agora é só fingir que sabe qual é a palavra.")

            case .person:

                Text("Todo mundo vai receber essa mesma palavra, exceto o ")
                +
                Text("impostor.")
                    .foregroundStyle(.guessPoDarkRed)

            }

        }
    }
}

#Preview {
    WordRevealScreen(navigationCoordinator: .constant(.init()))
}
