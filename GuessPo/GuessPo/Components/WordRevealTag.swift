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
                .foregroundColor(.geckoLightRed)
                .overlay {
                    Text(title)
                        .frame(alignment: .center)
                        .font(.geckoTitan(17))
                        .foregroundStyle(.geckoDarkRed)
                }
        } else {
            RoundedRectangle(cornerRadius: 50)
                .foregroundColor(.geckoLightBlue)
                .overlay {
                    Text(title)
                        .frame(alignment: .center)
                        .font(.geckoTitan(17))
                        .foregroundStyle(.geckoDarkBlue)
                }
        }
    }
}

#Preview {
    WordRevealTag(title: "Word Reveal Tag", isImpostor: true)
        .padding(.horizontal, 20)
        .padding(.vertical, 352)
}
