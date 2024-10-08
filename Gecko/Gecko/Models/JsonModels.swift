//  Created by Caio de Almeida Pessoa on 05/09/24.
//

import Foundation

struct WordsOfThemeJSON: Codable {
    let words: [String]
}

enum Categories: String {
    case places = "Places"
    case famous = "Famous"
    case animals = "Animals"
    case foods = "Foods"
    case characters = "Characters"
}
