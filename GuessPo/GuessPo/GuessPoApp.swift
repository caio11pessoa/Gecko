//
//  GuessPoApp.swift
//  GuessPo
//
//  Created by Caio de Almeida Pessoa on 30/08/24.
//

import SwiftUI

@main
struct GuessPoApp: App {
    @State var viewModel: GameViewModel = GameViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
