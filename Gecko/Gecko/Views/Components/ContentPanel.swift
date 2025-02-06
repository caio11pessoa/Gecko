//
//  ContentPanel.swift
//  Gecko
//
//  Created by Caio de Almeida Pessoa on 06/02/25.
//

import SwiftUI

struct ContentPanel<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
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
            Image(systemName: "globe")
            Image(systemName: "globe")
            Image(systemName: "globe")
            Image(systemName: "globe")
            
        }
    }
    .padding()
}
