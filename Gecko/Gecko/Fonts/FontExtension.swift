//  Created by Ian Pacini on 02/09/24.
//

import SwiftUI

extension View {
    func stroke(color: Color, width: CGFloat = 1) -> some View {
        modifier(StrokeModifier(strokeSize: width, strokeColor: color))
    }
}

struct StrokeModifier: ViewModifier {
    private let id = UUID()
    var strokeSize: CGFloat = 1
    var strokeColor: Color = .blue

    func body(content: Content) -> some View {
        if strokeSize > 0 {
            appliedStrokeBackground(content: content)
        } else {
            content
        }
    }

    private func appliedStrokeBackground(content: Content) -> some View {
        content
            .padding(strokeSize*2)
            .background(
                Rectangle()
                    .foregroundColor(strokeColor)
                    .mask(alignment: .center) {
                        mask(content: content)
                    }
            )
    }

    func mask(content: Content) -> some View {
        Canvas { context, size in
            context.addFilter(.alphaThreshold(min: 0.01))
            if let resolvedView = context.resolveSymbol(id: id) {
                context.draw(resolvedView, at: .init(x: size.width/2, y: size.height/2))
            }
        } symbols: {
            content
                .tag(id)
                .blur(radius: strokeSize)
        }
    }
}

struct CustomTextModifier: ViewModifier {
    var size: CGFloat
    func body(content: Content) -> some View {
        content
            .font(.custom("TitanOne", size: size)) // Fonte personalizada
//            .foregroundColor(.white) // Cor do texto principal
//            .padding(10) // Espaço interno ao redor do texto
//            .background(Color.black) // Contorno preto ao redor
            .cornerRadius(8) // Bordas arredondadas do contorno
            .overlay(
                content
                    .font(.custom("TitanOne", size: size))
                    .foregroundColor(.white)
                    .offset(x: -2, y: -2) // Contorno adicional leve
            )
//            .shadow(color: .black.opacity(1), radius: 1, x: 2, y: 2) // Sombra para 
//            .shadow(color: .black, radius: 2)
    }
}
struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}
extension View {
    func customTextStyle(size: CGFloat) -> some View {
        self.modifier(CustomTextModifier(size: size))
    }
}

//extension Text {
//    static geckoTitle() -> Text {
//        return
////        .font(.geckoTitan(48))
////        .overlay(
////            Text(gameViewModel.currentPlayer?.name ?? "Começando!")
////                .font(.custom("TitanOne", size: 48))
////                .foregroundColor(.white)
////                .offset(x: -4, y: -4) // Ajuste a posição da sombra/contorno para ficar levemente deslocada
////        )
////        .shadow(color: .black.opacity(0.2), radius: 4, x: 2, y: 2)
//    }
//}

extension Font {
    enum FontSizes: CGFloat {
        case largeTitle = 34
        case title = 28
        case title2 = 22
        case title3 = 20
        case body = 17
        case callout = 16
        case subheadline = 15
        case footnote = 13
        case caption = 12
        case caption2 = 11
    }
    @available(*, deprecated, message: "Use as funções da Versão 2")
    static func geckoTitan(_ customSize: CGFloat) -> Font {
            return .custom("TitanOne", size: customSize)
        }
    
    static func geckoTitanV2(_ customSize: CGFloat) -> Font{
        return .custom("TitanOne", size: customSize)
    }
    
    /// Font: TitanOne
    ///
    /// largeTitle - 34;   
    ///
    /// title - 28;
    ///
    /// title2 - 22;
    ///
    /// title3 - 20;   
    ///
    /// body - 17;
    ///
    /// callout - 16;
    ///
    /// subheadline - 15;
    ///
    /// footnote - 13;
    ///
    /// caption - 12;
    ///
    /// caption2 - 11;
    static func geckoPoTitan(_ size: FontSizes) -> Font {
        return .custom("TitanOne", size: size.rawValue)
    }
}
