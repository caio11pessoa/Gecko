//  Created by Julia Morales on 02/09/24.
//

import SwiftUI

// Temporario
fileprivate var themes: [Category] = [
    .init(themeName: "Locais", themeSymbol: "map.fill", wordList: ["Locais"], themeEnum: .places),
    .init(themeName: "Famosos", themeSymbol: "star.circle.fill", wordList: ["Famosos"], themeEnum: .famous),
    .init(themeName: "Animais", themeSymbol: "dog.fill", wordList: ["Animais"], themeEnum: .animals),
    .init(themeName: "Personagens", themeSymbol: "movieclapper.fill", wordList: ["Personagens"], themeEnum: .characters),
    .init(themeName: "Comidas", themeSymbol: "takeoutbag.and.cup.and.straw.fill", wordList: ["Comidas"], themeEnum: .foods)
    ]

struct ChooseCategoryView: View {
    
    @Binding var navigationCoordinator: NavigationCoordinator
    @Binding var gameViewModel: GameViewModel
    @State var currentTheme: Category = themes[0]
    
    let layout = Array(repeating: GridItem(.flexible()), count: 2)

    var body: some View {
        ZStack {
            Color(.geckoGray)
                .ignoresSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Escolha os temas da rodada")
                    .font(.geckoPoTitan(.title2))
                    .foregroundStyle(.geckoDarkBlue)
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
}
#Preview {
    ChooseCategoryView(navigationCoordinator: .constant(.init()), gameViewModel: .constant(.init()))
}
