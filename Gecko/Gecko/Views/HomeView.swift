//  Created by Caio de Almeida Pessoa on 02/09/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var navigationCoordinator = NavigationCoordinator()
    @State var gameViewModel = GameViewModel()
    
    var body: some View {
        NavigationStack(path: $navigationCoordinator.path) {
            
            VStack(alignment: .leading, spacing: 0) {
                
                setTitle(text: "Quem vai jogar?")
                    .padding(.top, 20)
                
                setSubTitle(text: "Adicione aqui os novos jogadores:")
                    .padding(.top, 4)
                
                setTextField("Adicionar", text: $gameViewModel.newPlayerName)
                    .padding(.top, 8)
                
                PrimaryButton(title: "Adicionar") {
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
                    .frame(height: 200)
                
                PrimaryButton( title: "Jogar" ) {
                    if gameViewModel.players.count < 3 {
                        gameViewModel.showingAlert = true
                    } else {
                        navigationCoordinator.appendToPath(.themeSelect)
                    }
                }
                .frame(height: 48)
                .padding(.top, 20)
                .padding(.bottom, 130)
                Spacer()
                
            }
            .toolbar {
                
                ToolbarItem(placement: .topBarTrailing) {
                    setToolbarIcon(systemName: "questionmark.circle")//features futuras
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    setToolbarIcon(systemName: "gearshape.fill")//features futuras
                }
            }
            .scenePadding(.horizontal)
            .background(.geckoGray)
            .navigationDestination(for: Routes.self) { route in
                switch route {
                case .home:
                    HomeView()
                case .themeSelect:
                    ThemeView(navigationCoordinator: $navigationCoordinator, gameViewModel: $gameViewModel)
                case .nameReveal:
                    // Essa tela deve ser refatorada na feat de regra de negocio para mudar seu init.
                    NameScreen(navigationCoordinator: $navigationCoordinator, gameViewModel: $gameViewModel)
                case .wordReveal:
                    // Essa tela deve ser refatorada na feat de regra de negocio para mudar seu init.
                    WordRevealScreen(navigationCoordinator: $navigationCoordinator, gameViewModel: $gameViewModel)
                case .gameStart:
                    StartGameScreen(navigationCoordinator: $navigationCoordinator)
                }
            }
            .alert("Jogadores insuficientes!", isPresented: $gameViewModel.showingAlert) {
                Button("OK", role: .cancel) {
                    gameViewModel.showingAlert = false
                }
            }
        }
    }
    
    func setTitle(text: String) -> Text {
        Text(text)
            .font(.geckoPoTitan(.title2))
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
            .textFieldStyle(GeckoTextFieldStyle())
    }
    
    func setToolbarIcon(systemName: String) -> some View{
        Image(systemName: systemName)
            .foregroundStyle(.geckoDarkBlue)
            .font(.system(size: 16))
    }
    
    var playerList: some View {
        RoundedRectangle(cornerRadius: 25)
            .foregroundStyle(.white)
            .overlay {
                List {
                    ForEach(gameViewModel.players, id: \.self){ player in
                        HStack{
                            Text(player.name)
                                .font(.geckoPoTitan(.callout))
                            
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

#Preview {
    HomeView()
}
