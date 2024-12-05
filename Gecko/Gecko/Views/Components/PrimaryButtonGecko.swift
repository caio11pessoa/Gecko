//
//  PrimaryButtonGecko.swift
//  Gecko
//
//  Created by Caio de Almeida Pessoa on 05/12/24.
//

import SwiftUI


struct PrimaryButtonGecko: View {
    
    var title: String
    @State var buttonAction: () -> Void
    
    var body: some View {
        Button(action: buttonAction) {
            ZStack{
                Group{
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.black)
                    .offset(x: 4, y: 4)
                    ZStack{
                        RoundedRectangle(cornerRadius:16)
                            .stroke(.black, lineWidth: 4)
                            .fill(.geckoV2Blue)
                        Text(title)
                            .foregroundStyle(.geckoGray)
                            .font(.geckoPoTitan(.callout))
                    }
                }
            }
        }
    }
}

#Preview {
    PrimaryButtonGecko(title: "Title!") {
        
    }
    .frame(width: 336, height: 48)
}
