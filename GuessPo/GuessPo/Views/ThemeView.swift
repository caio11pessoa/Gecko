//
//  ThemeView.swift
//  GuessPo
//
//  Created by Julia Morales on 02/09/24.
//

import SwiftUI

// Temporario
fileprivate var themes: [Theme] = [
    .init(themeName: "Locais", themeSymbol: "map", wordList: ["Locais"]),
    .init(themeName: "Famosos", themeSymbol: "star.circle.fill", wordList: ["Famosos"]),
    .init(themeName: "Animais", themeSymbol: "dog.fill", wordList: ["Animais"]),
    .init(themeName: "Personagens", themeSymbol: "movieclapper.fill", wordList: ["Personagens"]),
    .init(themeName: "Comidas", themeSymbol: "bag", wordList: ["Comidas"])
    ]

struct ThemeView: View {
    @Binding var navigationCoordinator: NavigationCoordinator
    
    @Binding var gameViewModel: GameViewModel
    
    // Criar logica de carregar temas default
    @State var currentTheme: Theme = themes.first!
    
    let layout = Array(repeating: GridItem(.flexible()), count: 2)

    var body: some View {
        ZStack {
            Color(.guessPoGray)
                .ignoresSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Escolha os temas da rodada")
                    .font(.guessPoTitan(.title2))
                    .foregroundStyle(.guessPoDarkBlue)
                    .padding(.top, 20)
                Text("Selecione um ou mais dos temas abaixo:")
                    .padding(.top, 4)
                
                ScrollView {
                    LazyVGrid(columns: layout, content: {
                        ForEach(themes, id: \.self) { theme in
                            ThemeButton(title: "\(theme.themeName)", symbol: theme.themeSymbol, isSelected: currentTheme == theme) {
                                currentTheme = theme
                            }
                            .frame(height: 150)
                        }
                    })
                    .padding(8)
                }
                .background(RoundedRectangle(cornerRadius: 15).foregroundStyle(.white))
                .padding(.top, 14)
                
                PrimaryButton(title: "Começar") {
                    gameViewModel.selectTheme(theme: currentTheme)
                    gameViewModel.prepareGame()
                    navigationCoordinator.appendToPath(.nameReveal)
                }
                .frame(height: 48)
                .padding(.top, 14)
                
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 18)
        }
    }
}
#Preview {
    ThemeView(navigationCoordinator: .constant(.init()), gameViewModel: .constant(.init()))
}
