//
//  ThemeButtonGecko.swift
//  Gecko
//
//  Created by Caio de Almeida Pessoa on 05/12/24.
//

import SwiftUI

struct ThemeButtonGecko: View {
    
    @State var title: String
    @State var symbol : String
    var isSelected: Bool
    @State var buttonAction: () -> Void
    
    
    var body: some View {
        Button(action: buttonAction) {
            RoundedRectangle(cornerRadius: 9)
                .presentationCornerRadius(30)
                .foregroundStyle(.geckoLightBlue)
                .overlay {
                    if isSelected {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.geckoDarkBlue, lineWidth: 3)
                    }
                    VStack {
                        Image(systemName: symbol)
                            .resizable()
                            .foregroundStyle(.geckoDarkBlue)
                            .frame(width: 50, height: 46)
                            .padding(.bottom, 10)
                        Text(title)
                            .foregroundStyle(.geckoDarkBlue)
                            .bold()
                            .font(.geckoTitan(20))
                    }
                }
        }
    }
}

#Preview {
    VStack{
        Group{
            
            ThemeButtonGecko(title: "Marcos", symbol: "trash.fill", isSelected: false, buttonAction: {
            })
            ThemeButtonGecko(title: "Marcos", symbol: "trash.fill", isSelected: false, buttonAction: {
            })
        }
        .frame(width: 144, height: 144)
    }
}
