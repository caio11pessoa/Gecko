//
//  WorldRevealTagGecko.swift
//  Gecko
//
//  Created by Caio de Almeida Pessoa on 07/02/25.
//

import SwiftUI

struct WorldRevealTagGecko: View {
    var title: String
    
    var body: some View {
        ZStack{
            Group{
                RoundedRectangle(cornerRadius: 16)
                    .fill(.black)
                    .offset(y: 6)
                ZStack{
                    RoundedRectangle(cornerRadius:16)
                        .stroke(.black, lineWidth: 4)
                        .fill(.white)
                    Text(title)
                        .foregroundStyle(.geckoV2TextBlack)
                        .font(.geckoPoTitan(.callout))
                }
            }
        }
    }
}

#Preview {
    WorldRevealTagGecko(title: "Michael Jackson")
        .frame(width: 336, height: 53)
}
