//  Created by Ian Pacini on 04/09/24.
//

import Foundation

struct Category: Identifiable, Hashable {
    var id: UUID = UUID()
    var themeName: String
    var themeSymbol: String
    var wordList: [String]
    var themeEnum: Categories
}
