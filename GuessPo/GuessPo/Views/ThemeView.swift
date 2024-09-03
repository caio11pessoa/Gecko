//
//  ThemeView.swift
//  GuessPo
//
//  Created by Julia Morales on 02/09/24.
//

import SwiftUI

enum themes: String, CaseIterable {
    case Locais = "map"
    case Famosos = "star.circle.fill"
    case Animais = "dog.fill"
    case Personagens = "movieclapper.fill"
    case Comidas = "bag"
}

struct ThemeView: View {
    let layout = Array(repeating: GridItem(.flexible()), count: 2)

    var body: some View {
        ZStack {
            Color(.guessPoGray)
                .ignoresSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text("Escolha os temas")
                    .font(.guessPoTitan(.title2))
                    .foregroundStyle(.guessPoDarkBlue)
                Text("Escolha o tema da palavra misteriosa:")
                
                ScrollView {
                    LazyVGrid(columns: layout, content: {
                        ForEach(themes.allCases, id: \.self) { theme in
                            ThemeButton(title: "\(theme)", symbol: theme.rawValue) {
                                //function
                            }
                            .frame(height: 150)
                        }
                    }).padding(8)
                }
                .background(RoundedRectangle(cornerRadius: 15).foregroundStyle(.white))
                
                PrimaryButton(title: "Começar") {
                    //function
                }
                .frame(width: 336, height: 48)
                
            }.padding()
        }
    }
}
#Preview {
    ThemeView()
}
