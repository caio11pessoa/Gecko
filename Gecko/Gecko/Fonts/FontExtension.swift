//  Created by Ian Pacini on 02/09/24.
//

import SwiftUI

extension View {
    func fontMaluca(size: CGFloat = 48) -> some View {
        stroke(color: .black, width: size/48)
            .customTextStyle(size: size)
    }
    private func stroke(color: Color, width: CGFloat = 1) -> some View {
        modifier(StrokeModifier(strokeSize: width, strokeColor: color))
    }
    private func customTextStyle(size: CGFloat) -> some View {
        modifier(CustomTextModifier(size: size))
    }
}

struct StrokeModifier: ViewModifier {
    private let id = UUID()
    var strokeSize: CGFloat
    var strokeColor: Color = .blue
    
    func body(content: Content) -> some View {
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
            context.addFilter(.alphaThreshold(min: 0.9))
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
    var titanFont: Font { .custom("TitanOne", size: size) }
    var offsetProportional: CGFloat { -size/24 }
    var colorOverlayer: Color = .white
    func body(content: Content) -> some View {
        content
            .font(titanFont)
            .overlay(
                content
                    .font(titanFont)
                    .foregroundColor(colorOverlayer)
                    .offset(x: offsetProportional, y: offsetProportional)
            )
    }
}

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
