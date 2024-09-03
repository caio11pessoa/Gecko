//
//  WordReveal.swift
//  GuessPo
//
//  Created by Caio de Almeida Pessoa on 02/09/24.
//

import SwiftUI

struct WordRevealScreen: View {

    var player: String = "Pedro"
    var word: String = "Word"
    
    var body: some View {

        VStack(spacing: 0) {

            Spacer()

            Text(player)
                .font(.guessPoTitan(48))
                .foregroundStyle(.guessPoDarkBlue)
            
            Text("A palavra da rodada é:")
                .font(.system(size: 16))
                .bold()
                .fontDesign(.rounded)
                .padding(.top, 18)
            
            WordRevealTag(title: word, isImpostor: false)
                .frame(height: 54)
                .padding(.top, 18)
            
            textContent
                .font(.system(size: 16))
                .bold()
                .fontDesign(.rounded)
                .padding(.top, 32)
            
            Spacer()
            
            PrimaryButton(title: "Entendido!") {
                // Próxima tela
            }
            .frame(height: 48)
            .padding(.bottom, 32)

        }
        .padding(.horizontal, 38)
        .ignoresSafeArea()

    }
    
    var textContent: some View {

        Group {

            Text("Todo mundo vai receber essa mesma palavra, exceto o ")
            +
            Text("impostor.")
                .foregroundStyle(.guessPoDarkRed)

        }
    }
}

#Preview {
    WordRevealScreen()
}
