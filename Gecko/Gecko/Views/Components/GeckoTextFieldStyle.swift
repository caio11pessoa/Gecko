//  Created by Caio de Almeida Pessoa on 02/09/24.
//

import SwiftUI

struct GeckoTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(.white)
            .cornerRadius(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 0.2)
            }
            .font(.geckoPoTitan(.callout))
    }
}
