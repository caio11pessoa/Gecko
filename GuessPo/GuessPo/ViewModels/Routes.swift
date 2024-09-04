//
//  Routes.swift
//  GuessPo
//
//  Created by Ian Pacini on 03/09/24.
//

import SwiftUI

enum Routes: Hashable {
case home, nameReveal, wordReveal
}

struct RoutesEnvironmentKey: EnvironmentKey {
    static let defaultValue: [Routes] = []
}

extension EnvironmentValues {
    var path: [Routes] {
        get { self[RoutesEnvironmentKey.self] }
        set { self[RoutesEnvironmentKey.self] = newValue }
    }
}
