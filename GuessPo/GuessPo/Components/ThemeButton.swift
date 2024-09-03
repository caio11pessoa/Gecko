//
//  ThemeButton.swift
//  GuessPo
//
//  Created by Gabriel Santiago on 02/09/24.
//

import SwiftUI

struct ThemeButton: View {
    
    @State var title: String
    @State var symbol : String
    @State var buttonAction: () -> Void
    @State var isSelected: Bool = false
    
    var body: some View {
        Button(action: buttonAction) {
            RoundedRectangle(cornerRadius: 9)
                .presentationCornerRadius(30)
                .foregroundStyle(.guessPoLightBlue)
                .overlay {
                    if isSelected {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.guessPoDarkBlue, lineWidth: 3)
                    }
                    VStack {
                        Image(systemName: symbol)
                            .resizable()
                            .foregroundStyle(.guessPoDarkBlue)
                            .frame(width: 40, height: 40)
                            .padding(.bottom, 10)
                        Text(title)
                            .foregroundStyle(.guessPoDarkBlue)
                            .bold()
                            .font(.guessPoTitan(20))
                    }
                }
                .onTapGesture {
                    isSelected.toggle()
                }
        }
    }
}

#Preview {
    ThemeButton(title: "Marcos", symbol: "trash.fill", buttonAction: {
        //
    })
    .padding(.horizontal, 50)
    .padding(.vertical, 300)
}
