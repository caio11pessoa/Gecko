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
    let layout = [ 
        GridItem(.fixed(100), spacing: 60),
        GridItem(.fixed(100))
    ]
//    let themes = ["Locais", "Famosos","Animais", "Personagens", "Comidas"]
    
    
    var body: some View {
        VStack(spacing: 50) {
            VStack(alignment: .leading) {
                Text("Escolha os temas")
                    .font(.guessPoTitan(.title2))
                    .foregroundStyle(.guessPoDarkBlue)
                Text("Escolha o tema da palavra misteriosa")
            }
            
            ScrollView {
                LazyVGrid(columns: layout, content: {
                    ForEach(themes.allCases, id: \.self) { theme in
                        ThemeButton(title: "Local", symbol: theme.rawValue) {
                            //function
                        }
                        .frame(width: 150, height: 150)
                    }
                })
            }
        }
        .padding()
    }
}

#Preview {
    ThemeView()
}
