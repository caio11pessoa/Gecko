//
//  NavigationCoordinator.swift
//  GuessPo
//
//  Created by Ian Pacini on 03/09/24.
//

import SwiftUI

@Observable
class NavigationCoordinator {
    var path: [Routes] = []
    
    func appendToPath(_ route: Routes) {
        path.append(route)
    }
    
    func popPath() -> Routes? {
        return path.popLast()
    }
    
    func goToRoot() {
        path.removeAll()
    }
    
    func goToThemeSelect() {
        path = [.themeSelect]
    }

}
