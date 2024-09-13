
//  Created by Caio de Almeida Pessoa on 05/09/24.
//

import Foundation

class JSONManager {
    
    private static func getJsonData(_ theme: Categories) -> Data? {
        
        do {
            if let filePath = Bundle.main.path(forResource: theme.rawValue, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
        
    };
    
    private static func parseObject(jsonData: Data) -> WordsOfThemeJSON? {
        
        do {
            
            let decodedData = try JSONDecoder().decode(WordsOfThemeJSON.self, from: jsonData)
            return decodedData
            
        } catch {
            
            print("error: \(error)")
            
        }
        return nil
    };
    
    static func getWordsFor(theme: Categories) -> WordsOfThemeJSON? {
        
        guard let data: Data = getJsonData(theme) else { return nil }
        let words: WordsOfThemeJSON? = parseObject(jsonData: data)
        return words
        
    }
}
