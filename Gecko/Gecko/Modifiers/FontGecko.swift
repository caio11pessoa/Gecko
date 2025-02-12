//
//  TextFontModifier.swift
//  Gecko
//
//  Created by Caio de Almeida Pessoa on 07/11/24.
//

import SwiftUI

struct FontGecko: View {
    var body: some View {
        Text("Hello, World!")
            .fontGecko(size: 20)
    }
}

extension View {
    func fontGecko(size: CGFloat = 24, strokeColor: Color = .black, foregroundColor: Color = .white) -> some View {
        return stroke(color: strokeColor, width: size/24)
            .customTextStyle(size: size, shadeColor: strokeColor, foregroundColor: foregroundColor)
    }
    
    private func stroke(color: Color, width: CGFloat = 1) -> some View {
        modifier(StrokeModifier(strokeSize: width, strokeColor: color))
    }
    
    private func customTextStyle(size: CGFloat, shadeColor: Color, foregroundColor: Color) -> some View {
        modifier(TitanFontShadeTextModifier(size: size, foregroundColor: foregroundColor, shadeColor: shadeColor))
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

struct TitanFontShadeTextModifier: ViewModifier {
    var size: CGFloat
    var titanFont: Font { .custom("TitanOne", size: size) }
    var offsetProportional: CGFloat { -size/14 }
    var foregroundColor: Color = .white
    var shadeColor: Color
    func body(content: Content) -> some View {
        content
            .foregroundStyle(shadeColor)
            .font(titanFont)
            .overlay(
                content
                    .font(titanFont)
                    .foregroundColor(foregroundColor)
                    .offset(x: offsetProportional, y: offsetProportional)
            )
    }
}

#Preview {
    FontGecko()
}
