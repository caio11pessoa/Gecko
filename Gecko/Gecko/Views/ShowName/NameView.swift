//  Created by Ian Pacini on 02/09/24.
//

import SwiftUI

struct ShowNameView: View {
    
    @Binding var navigationCoordinator: NavigationCoordinator
    @Binding var gameViewModel: GameViewModel
    
    var body: some View {
            VStack {
                HStack {
                    Text("Passe o celular para:")
                        .font(.geckoPoTitan(.title3))
                    Spacer()
                }
                
                Spacer()
                
                nameLabel(player: gameViewModel.currentPlayer == nil ? .init(name: "Jogador 1") : gameViewModel.currentPlayer)
                
                Spacer()
                
                PrimaryButton(title: "Eu sou o \(gameViewModel.getCurrentPlayerName())") {
                    guard gameViewModel.currentPlayer != nil else {
                        return
                    }
                    navigationCoordinator.appendToPath(.wordReveal)
                }
                .frame(height: 48)
                .padding(.bottom, 20)
            }
            .foregroundStyle(.geckoDarkBlue)
            .padding(.horizontal, 20)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    BackButton() {
                        gameViewModel.showingBackButtonAlert = true
                    }
                }
            }
            .alert(isPresented: $gameViewModel.showingBackButtonAlert) {
            Alert(
                title: Text("O jogo irá reiniciar e uma nova palavra será sorteada!"),
                primaryButton: .destructive(
                    Text("Ok"),
                    action: { _ = navigationCoordinator.popPath()}
                ),
                secondaryButton: .cancel()
            )
        }
    }
    
    func nameLabel(player: Player?) -> some View {
        VStack {
            Image(systemName: "eyes")
                .font(.custom("default", size: 120))
            
            Text(player?.name ?? "Jogador")
                .font(.geckoTitan(48))
        }
    }
}

#Preview {
    NavigationStack {
        NavigationLink {
            ShowNameView(navigationCoordinator: .constant(.init()), gameViewModel: .constant(.init()))
            
        } label: {
            Text("Teste")
        }
    }
}
