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
//        ZStack {
                VStack {
                    HStack {
                        Text("Passe o celular para:")
                            .font(.guessPoTitan(.title3))
                        Spacer()
                    }
                    
                    Spacer()
                    
                    nameLabel(player: gameViewModel.currentPlayer)
                    
                    Spacer()
                    PrimaryButton(title: "Eu sou o \(gameViewModel.currentPlayer!.name)") {
                        navigationCoordinator.appendToPath(.wordReveal)
                    }
                    .frame(height: 48)
                }
                .foregroundStyle(.guessPoDarkBlue)
                .padding(.horizontal, 20)
//        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton() {
                    _ = navigationCoordinator.popPath()
                }
            }
        }
    }
}

    func nameLabel(player: Player?) -> some View {
        VStack {
            Image(systemName: "eyes")
                .font(.custom("default", size: 120))
            
            Text("\(player!.name)")
                .font(.guessPoTitan(48))
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
