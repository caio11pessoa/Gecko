//  Created by Ian Pacini on 02/09/24.
//

import SwiftUI

struct NameScreen: View {
    
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
                        _ = navigationCoordinator.popPath()
                    }
                }
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
            NameScreen(navigationCoordinator: .constant(.init()), gameViewModel: .constant(.init()))
            
        } label: {
            Text("Teste")
        }
    }
}
