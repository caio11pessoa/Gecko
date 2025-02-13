//
//  PrimaryButtonGecko.swift
//  Gecko
//
//  Created by Caio de Almeida Pessoa on 05/12/24.
//

import SwiftUI

struct PrimaryButtonGecko: View {
    
    var title: String
    @Binding var isDisabled: Bool
    var buttonAction: () -> Void
    
    init(title: String, isDisabled: Binding<Bool> = .constant(false), buttonAction: @escaping () -> Void) {
        self.title = title
        self._isDisabled = isDisabled
        self.buttonAction = buttonAction
    }
    
    var body: some View {
        Button(action: {
            if !isDisabled {
                buttonAction()
            }
        }) {
            ZStack {
                Group {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.black)
                        .offset(y: 4)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.black, lineWidth: 4)
                            .fill(isDisabled ? .geckoV2DarkGray : .geckoV2Blue)
                        
                        Text(title)
                            .foregroundStyle(isDisabled ? .geckoV2TextSecondaryButton : .geckoGray)
                            .font(.geckoPoTitan(.callout))
                    }
                }
            }
        }
        .disabled(isDisabled)
    }
}

#Preview {
    @Previewable @State var isDisabled = true
    
    return PrimaryButtonGecko(title: "Title!", isDisabled: $isDisabled) {
        print("Botão pressionado!")
    }
    .frame(width: 336, height: 48)
}
