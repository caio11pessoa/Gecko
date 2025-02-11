//
//  SecondButtonGecko.swift
//  Gecko
//
//  Created by Caio de Almeida Pessoa on 07/02/25.
//

import SwiftUI

struct SecondButtonGecko: View {
    var title: String
    @State var buttonAction: () -> Void
    
    var body: some View {
        Button(action: buttonAction) {
            ZStack{
                Group{
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.black)
                    .offset(y: 4)
                    ZStack{
                        RoundedRectangle(cornerRadius:16)
                            .stroke(.black, lineWidth: 4)
                            .fill(.geckoV2DarkGray)
                        Text(title)
                            .foregroundStyle(.geckoV2TextSecondaryButton)
                            .font(.geckoPoTitan(.callout))
                    }
                }
            }
        }
    }
}

#Preview {
    SecondButtonGecko(title: "Title!") {
        
    }
    .frame(width: 336, height: 48)
}
