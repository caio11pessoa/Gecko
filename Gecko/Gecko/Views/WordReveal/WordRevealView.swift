//  Created by Caio de Almeida Pessoa on 02/09/24.
//

import SwiftUI

struct WordRevealView: View {
    
    @Binding var navigationCoordinator: NavigationCoordinator
    @Binding var gameViewModel: GameViewModel

    var body: some View {
        VStack(spacing: 0) {

            Spacer()

            Text(gameViewModel.currentPlayer?.name ?? "Começando!").stroke(color: .black, width: 1)
                .customTextStyle(size: 48)
//                .font(.geckoTitan(48))
//                .overlay(
//                    Text(gameViewModel.currentPlayer?.name ?? "Começando!")
//                        .font(.custom("TitanOne", size: 48))
//                        .foregroundColor(.white)
//                        .offset(x: -4, y: -4) // Ajuste a posição da sombra/contorno para ficar levemente deslocada
//                )
//                .shadow(color: .black.opacity(0.2), radius: 4, x: 2, y: 2)
//                .foregroundStyle(.geckoDarkBlue)
            
            Text(gameViewModel.getWordTextPreview())
                .font(.system(size: 16))
                .bold()
                .fontDesign(.rounded)
                .padding(.top, 18)
            
            WordRevealTag(title: gameViewModel.getWord(), isImpostor: gameViewModel.playerIsImposter())
                .frame(height: 54)
                .padding(.top, 18)
            
            textContent
                .font(.system(size: 16))
                .bold()
                .fontDesign(.rounded)
                .padding(.top, 32)
            
            Spacer()
            
            PrimaryButton(title: "Entendido!") {
                gameViewModel.nextPlayer()
                if(gameViewModel.isLastPlayer) {
                    navigationCoordinator.appendToPath(.gameStart)
                } else {
                    _ = navigationCoordinator.popPath()
                }
            }
            .frame(height: 48)
            .padding(.bottom, 20)

        }
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden()

    }
    
    var textContent: some View {
        Group {
            if gameViewModel.playerIsImposter() {
                Text("O tema da rodada é ")
                +
                Text(gameViewModel.selectedTheme?.themeName ?? "Tema Secreto")
                    .foregroundStyle(.blue)
                +
                Text(", agora é só fingir que sabe qual é a palavra.")
            } else {
                Text("Todo mundo vai receber essa mesma palavra, exceto o ")
                +
                Text("impostor.")
                    .foregroundStyle(.geckoDarkRed)
            }
        }
    }
}

#Preview {
    WordRevealView(navigationCoordinator: .constant(.init()), gameViewModel: .constant(.init()))
}
