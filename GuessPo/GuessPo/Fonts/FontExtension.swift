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
    
    static func geckoTitan(_ customSize: CGFloat) -> Font {
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
