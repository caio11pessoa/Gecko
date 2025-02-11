//  Created by Caio de Almeida Pessoa on 02/09/24.
//

import SwiftUI

struct GeckoTextFieldStyleV2: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(.white)
            .cornerRadius(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1.5)
            }
            .font(.system(size: 16))
            .bold()
    }
}

#Preview {
    VStack {
        TextField("Test", text: .constant(""))
            .textFieldStyle(GeckoTextFieldStyleV2())
    }
}
