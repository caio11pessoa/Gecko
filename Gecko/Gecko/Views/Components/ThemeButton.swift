//  Created by Gabriel Santiago on 02/09/24.
//

import SwiftUI

struct ThemeButton: View {
    
    @State var title: String
    @State var symbol : String
    var isSelected: Bool
    @State var buttonAction: () -> Void
    
    
    var body: some View {
        Button(action: buttonAction) {
            RoundedRectangle(cornerRadius: 9)
                .presentationCornerRadius(30)
                .foregroundStyle(.geckoLightBlue)
                .overlay {
                    if isSelected {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.geckoDarkBlue, lineWidth: 3)
                    }
                    VStack {
                        Image(systemName: symbol)
                            .resizable()
                            .foregroundStyle(.geckoDarkBlue)
                            .frame(width: 40, height: 40)
                            .padding(.bottom, 10)
                        Text(title)
                            .foregroundStyle(.geckoDarkBlue)
                            .bold()
                            .font(.geckoTitan(20))
                    }
                }
        }
    }
}

#Preview {
    ThemeButton(title: "Marcos", symbol: "trash.fill", isSelected: false, buttonAction: {
        //
    })
    .padding(.horizontal, 50)
    .padding(.vertical, 300)
}
