//
//  BackButtonGecko.swift
//  Gecko
//
//  Created by Caio de Almeida Pessoa on 07/02/25.
//

import SwiftUI

struct BackButtonGecko: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundStyle(.geckoV2TextBlack)
        }
    }
}

#Preview {
    BackButtonGecko {
        
    }
}
