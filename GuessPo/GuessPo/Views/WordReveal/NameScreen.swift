//
//  NameScreen.swift
//  GuessPo
//
//  Created by Ian Pacini on 02/09/24.
//

import SwiftUI

struct NameScreen: View {
    @State var player: Player
    
    
    var body: some View {
        VStack {
            HStack {
                Text("Passe o celular para:")
                    .font(.guessPoTitan(.title3))
                Spacer()
            }
            
            Spacer()
            
            nameLabel
            
            Spacer()

            PrimaryButton(title: "Eu sou o \(player.name)") {
                print("")
            }
            .frame(height: 48)
        }
        .foregroundStyle(.guessPoDarkBlue)
        .padding(.horizontal, 20)
    }
    
    var nameLabel: some View {
        VStack {
            Image(systemName: "eyes")
                .font(.custom("default", size: 120))
            
            Text("\(player.name)")
                .font(.guessPoTitan(48))
        }
    }
}

#Preview {
    NameScreen(player: .init(name: "Caio", role: .imposter))
}
