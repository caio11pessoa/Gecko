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
    func setTextField(_ placeholder: LocalizedStringKey, text: Binding<String>) -> some View {
        TextField(placeholder, text: text)
            .textFieldStyle(OvalTextFieldStyle())
    }
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                setTitle(
                    text: "Quem vai jogar?"
                )
                .padding(.top, 20)
                setSubTitle(
                    text: "Adicione aqui os novos jogadores:"
                )
                .padding(.top, 4)
                
                setTextField("Adicionar", text: $newPlayer)
                    .padding(.top, 8)
                PrimaryButton(
                    title: "Adicionar"
                ) {
                    print("Adicionar")
                }
                .frame(height: 48)
                .padding(.top, 16)
                setTitle(
                    text: "Participantes"
                )
                .padding(.top, 44)
                setSubTitle(
                    text: "Aqui estão todos os participantes até o momento:"
                )
                .padding(.top, 4)
                List(players, id: \.self) { player in
                    Text(player)
                }
                .listStyle(.plain)
                .padding(.top, 20)
                .frame(height: 260)
                PrimaryButton(
                    title: "Jogar"
                ) {
                    print("Jogar")
                }
                .frame(height: 48)
                .padding(.top, 20)
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "questionmark.circle")
                        .foregroundStyle(.guessPoDarkBlue)
                        .font(.system(size: 16))
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "gearshape.fill")
                        .foregroundStyle(.guessPoDarkBlue)
                        .font(.system(size: 16))
                }
            }
            .scenePadding(.horizontal)
            .background(.guessPoGray)
        }
    }
}

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(.white)
            .cornerRadius(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 0.2)
            }
            .font(.guessPoTitan(.callout))
    }
}

#Preview {
    HomeView()
}
