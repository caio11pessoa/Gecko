//
//  WordRevealTag.swift
//  GuessPo
//
//  Created by Gabriel Santiago on 02/09/24.
//

import SwiftUI

struct WordRevealTag: View {
    
    @State var title: String
    @State var isImpostor: Bool
    
    var body: some View {
        buildDisplayTag(title: title, isImpostor: isImpostor)
    }
    
    @ViewBuilder func buildDisplayTag(title: String, isImpostor: Bool) -> some View {
        if isImpostor {
            
            RoundedRectangle(cornerRadius: 50)
                .foregroundColor(.guessPoLightRed)
                .overlay {
                    Text(title)
                        .frame(alignment: .center)
                        .font(.guessPoTitan(17))
                        .foregroundStyle(.guessPoDarkRed)
                }
        } else {
            RoundedRectangle(cornerRadius: 50)
                .foregroundColor(.guessPoLightBlue)
                .overlay {
                    Text(title)
                        .frame(alignment: .center)
                        .font(.guessPoTitan(17))
                        .foregroundStyle(.guessPoDarkBlue)
                }
        }
    }
}

#Preview {
    WordRevealTag(title: "Marcelino pão e vinho", isImpostor: true)
        .padding(.horizontal, 20)
        .padding(.vertical, 352)
}
