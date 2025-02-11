//  Created by Caio de Almeida Pessoa on 02/09/24.
//

import SwiftUI

struct HomeViewGecko: View {
    
    @Binding var navigationCoordinator: NavigationCoordinator
    @Binding var gameViewModel: GameViewModel
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(.geckoV2LightYellow)
            
            VStack(alignment: .leading, spacing: 0) {
                
                setTitle(text: "Quem vai jogar?")
                    .padding(.top, 100)
                
                setSubTitle(text: "Coloque aqui o nome do jogador que quer adicionar")
                    .padding(.top, 4)
                
                setTextField("Adicionar", text: $gameViewModel.newPlayerName)
                    .padding(.top, 8)
                PrimaryButtonGecko(title: "Adicionar") {
                    gameViewModel.addPlayer()
                }
                .frame(height: 48)
                .padding(.top, 16)
                .alert("Necessário pelo menos 2 caracteres!", isPresented: $gameViewModel.showingAlertName) {
                    Button("OK", role: .cancel) {
                        gameViewModel.showingAlertName = false
                    }
                }
                
                setTitle( text: "Participantes" )
                    .padding(.top, 44)
                
                setSubTitle( text: "Aqui estão todos os participantes até o momento:")
                    .padding(.top, 4)
                
                playerList
                    .padding(.top, 20)
                    .frame(height: 237)
                
                // TODO: Refactor component to properly handle disabled mode

                SecondButtonGecko(title: "Jogar") {
                    if gameViewModel.players.count < 3 {
                        gameViewModel.showingAlert = true
                    } else {
                        navigationCoordinator.appendToPath(.themeSelect)
                    }
                }
                .frame(height: 48)
                .padding(.top, 20)
                Spacer()
            }
            .scenePadding(.horizontal)
            .navigationDestination(for: Routes.self) { route in
                switch route {
                case .home:
                    HomeView(navigationCoordinator: $navigationCoordinator, gameViewModel: $gameViewModel)
                case .themeSelect:
                    ChooseCategoryView(navigationCoordinator: $navigationCoordinator, gameViewModel: $gameViewModel)
                case .nameReveal:
                    // Essa tela deve ser refatorada na feat de regra de negocio para mudar seu init.
                    ShowNameView(navigationCoordinator: $navigationCoordinator, gameViewModel: $gameViewModel)
                case .wordReveal:
                    // Essa tela deve ser refatorada na feat de regra de negocio para mudar seu init.
                    WordRevealView(navigationCoordinator: $navigationCoordinator, gameViewModel: $gameViewModel)
                case .gameStart:
                    StartGameView(navigationCoordinator: $navigationCoordinator)
                }
            }
            .alert("Jogadores insuficientes!", isPresented: $gameViewModel.showingAlert) {
                Button("OK", role: .cancel) {
                    gameViewModel.showingAlert = false
                }
            }
        }
        .ignoresSafeArea()
    }
    
    func setTitle(text: String) -> some View {
        Text(text)
            .fontGecko(size: 20)
            .foregroundStyle(.geckoDarkBlue)
    }
    
    func setSubTitle(text: String) -> Text {
        Text(text)
            .fontDesign(.rounded)
            .font(.system(size: 16))
    }
    
    func setTextField(
        _ placeholder: LocalizedStringKey,
        text: Binding<String>
    ) -> some View {
        
        TextField(placeholder, text: text)
            .textFieldStyle(GeckoTextFieldStyleV2())
    }
    
    func setToolbarIcon(systemName: String) -> some View{
        Image(systemName: systemName)
            .foregroundStyle(.geckoDarkBlue)
            .font(.system(size: 16))
    }
    
    var playerList: some View {
        ContentPanel {
            if(gameViewModel.players.isEmpty){
                VStack{
                    HStack{
                        Image(.geckoIconGray)
                        Image(.geckoIconGray)
                        Image(.geckoIconGray)
                        Image(.geckoIconAddGecko)
                    }
                    Group{
                        Text("Nenhum jogador no momento :(")
                            .font(.system(size: 14))
                            .bold()
                        Text("Pra começar a jogar adicione pelo menos ")
                        + Text("3 jogadores")
                            .bold()
                    }
                    .font(.system(size: 14))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                }
                .frame(maxWidth: .infinity , maxHeight: .infinity)
            }else {
                List {
                    ForEach(gameViewModel.players, id: \.self){ player in
                        HStack{
                            Text(player.name)
                                .fontDesign(.rounded)
                                .font(.system(size: 16))
                                .bold()
                            
                            Spacer()
                            
                            Image(systemName: "x.circle")
                                .font(.system(size: 16))
                                .foregroundStyle(Color(red: 179/255, green: 179/255, blue: 179/255 ))
                                .onTapGesture {
                                    gameViewModel.deletePlayer(player)
                                }
                        }
                        .listRowBackground(Color.clear)
                    }
                    .onMove(perform: gameViewModel.movePlayer)
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
            }
            
        }
    }
}

#Preview {
    HomeViewGecko(navigationCoordinator: .constant(NavigationCoordinator()), gameViewModel: .constant(GameViewModel()))
}
