//
//  PrimaryButton.swift
//  GuessPo
//
//  Created by Gabriel Santiago on 02/09/24.
//

import SwiftUI

struct PrimaryButton: View {
    
    @State var title: String
    @State var buttonAction: () -> Void
    
    var body: some View {
        Button(action: buttonAction) {
            RoundedRectangle(cornerRadius: 9)
                .presentationCornerRadius(30)
                .foregroundStyle(.guessPoDarkBlue)
                .overlay {
                    Text(title)
                        .foregroundStyle(.guessPoGray)
                        .fontDesign(.rounded)
                        .bold()
                        .font(.system(size: 21))
                }
        }
    }
}

#Preview {
    PrimaryButton(title: "Botaozinho", buttonAction: {
        //
    })
}
