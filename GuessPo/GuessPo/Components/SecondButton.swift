//  Created by Caio de Almeida Pessoa on 05/09/24.
//

import SwiftUI

struct SecondButton: View {
    
    @State var title: String
    @State var buttonAction: () -> Void
    
    var body: some View {
        Button(action: buttonAction) {
            RoundedRectangle(cornerRadius: 9)
                .presentationCornerRadius(30)
                .foregroundStyle(.clear)
                .overlay {
                    RoundedRectangle(cornerRadius: 9)
                        .stroke(lineWidth: 2.0)
                        .foregroundStyle(.geckoDarkBlue)
                    Text(title)
                        .foregroundStyle(.geckoDarkBlue)
                        .fontDesign(.rounded)
                        .font(.headline)
                }
        }
    }
}

#Preview {
    SecondButton(title: "Button", buttonAction: {
        //
    })
    .frame(width: 144, height: 44)
}
