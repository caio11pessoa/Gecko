//
//  HomeView.swift
//  GuessPo
//
//  Created by Caio de Almeida Pessoa on 02/09/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var newPlayer: String = ""
    @State var players: [String] = [
        "Pedro","Ian", "Lais", "Caio", "Julia", "Joao"
    ]
    
    var body: some View {

        NavigationStack {

            VStack(alignment: .leading, spacing: 0) {
                
                setTitle( text: "Quem vai jogar?" )
                    .padding(.top, 20)
                
                setSubTitle( text: "Adicione aqui os novos jogadores:")
                    .padding(.top, 4)
                
                setTextField("Adicionar", text: $newPlayer)
                    .padding(.top, 8)
                
                PrimaryButton( title: "Adicionar") {
                    // add novo jogador
                }
                .frame(height: 48)
                .padding(.top, 16)
                
                setTitle( text: "Participantes" )
                    .padding(.top, 44)
                
                setSubTitle( text: "Aqui estão todos os participantes até o momento:")
                    .padding(.top, 4)
                
                playerList
                    .padding(.top, 20)
                
                PrimaryButton( title: "Jogar" ) {
                    //Navegação
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
            .background(.guessPoGray)

        }
    }
    
    func setTitle(text: String) -> Text {

        Text(text)
            .font(.guessPoTitan(.title2))
            .foregroundStyle(.guessPoDarkBlue)

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
            .textFieldStyle(GuessPoTextFieldStyle())

    }

    func setToolbarIcon(systemName: String) -> some View{

        Image(systemName: systemName)
            .foregroundStyle(.guessPoDarkBlue)
            .font(.system(size: 16))

    }
    
    var playerList: some View {

        RoundedRectangle(cornerRadius: 25)
            .foregroundStyle(.white)
            .overlay {

                List(players, id: \.self) { player in

                    Text(player)
                        .font(.guessPoTitan(.callout))
                        .listRowBackground(Color.clear)

                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)

            }
    }
}

#Preview {
    HomeView()
}
