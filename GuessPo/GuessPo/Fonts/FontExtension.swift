//
//  FontExtension.swift
//  GuessPo
//
//  Created by Ian Pacini on 02/09/24.
//

import SwiftUI

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
    
    static func guessPoTitan(_ customSize: CGFloat) -> Font {
            return .custom("TitanOne", size: customSize)
        }
        
    static func guessPoTitan(_ size: FontSizes) -> Font {
        return .custom("TitanOne", size: size.rawValue)
    }
}
