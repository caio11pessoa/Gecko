//  Created by Ian Pacini on 03/09/24.
//

import SwiftUI

@Observable
class NavigationCoordinator {
    // Nossa Stack
    var path: [Routes] = []
    
    // Push [tela1] -> appendToPath [tela1, tela2]
    func appendToPath(_ route: Routes) {
        path.append(route)
    }
    // Push [tela1] -> appendToPath [tela1]
    func popPath() -> Routes? {
        return path.popLast()
    }
    
    // Path[]
    func goToRoot() {
        path.removeAll()
    }
    
    // path[themeSelect]
    func goToThemeSelect() {
        path = [.themeSelect]
    }
}
