//  Created by Gabriel Santiago on 02/09/24.
//

import SwiftUI

struct PrimaryButton: View {
    
    var title: String
    @State var buttonAction: () -> Void
    
    var body: some View {
        Button(action: buttonAction) {
            RoundedRectangle(cornerRadius: 9)
                .presentationCornerRadius(30)
                .foregroundStyle(.geckoDarkBlue)
                .overlay {
                    Text(title)
                        .foregroundStyle(.geckoGray)
                        .fontDesign(.rounded)
                        .font(.headline)
                }
        }
    }
}

#Preview {
    PrimaryButton(title: "Button", buttonAction: {
        //
    })
}
