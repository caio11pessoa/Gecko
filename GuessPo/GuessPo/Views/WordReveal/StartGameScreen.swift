//
//  StartGameScreen.swift
//  GuessPo
//
//  Created by Caio de Almeida Pessoa on 03/09/24.
//

import SwiftUI

struct StartGameScreen: View {
    @Binding var navigationCoordinator: NavigationCoordinator
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            Spacer()
            
            Image(systemName: "person.fill.questionmark")
                .font(.system(size: 120))
                .foregroundStyle(.guessPoDarkBlue)
            
            Text("Que comecem os jogos!")
                .font(.guessPoTitan(44))
                .multilineTextAlignment(.center)
                .foregroundStyle(.guessPoDarkBlue)
            
            Text("Hora de descobrir quem é o impostor!")
                .font(.system(size: 16))
                .bold()
                .padding(.top, 16)
            
            Spacer()
            
            PrimaryButton(title: "Nova Rodada!") {
                navigationCoordinator.popPath()
            }
            .frame(height: 44)
            
            SecondButton(title: "voltar ao Início") {
                navigationCoordinator.goToRoot()
            }
            .frame(height: 44)
            .padding(.bottom, 32)
            .padding(.top, 8)
            
        }
        .padding(.horizontal, 26)
        .ignoresSafeArea()
        
    }
}

#Preview {
    StartGameScreen(navigationCoordinator: .constant(.init()))
}
