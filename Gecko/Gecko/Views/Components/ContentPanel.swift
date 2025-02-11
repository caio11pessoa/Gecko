//
//  ContentPanel.swift
//  Gecko
//
//  Created by Caio de Almeida Pessoa on 06/02/25.
//

import SwiftUI

struct ContentPanel<Content: View>: View {
    let content: Content
    let spacing: CGFloat
    
    init(spacing: CGFloat = 8, @ViewBuilder content: @escaping () -> Content) {
        self.spacing = spacing
        self.content = content()
    }
    
    var body: some View {
        content
            .padding(spacing)
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .offset(y: 4)
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.black, lineWidth: 4)
                            .fill(.white)
                    }
            }
    }
}


#Preview {
    ContentPanel {
        VStack{
            Text("Content!")
                .foregroundStyle(.black)
                .font(.geckoPoTitan(.callout))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    .padding()
}
