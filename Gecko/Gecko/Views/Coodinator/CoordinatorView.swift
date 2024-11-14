//
//  CoordinatorView.swift
//  Gecko
//
//  Created by Caio de Almeida Pessoa on 14/11/24.
//

import SwiftUI

struct CoordinatorView: View {
    
    @State private var splashScreenIsActive = true
    
    @Binding var viewModel: GameViewModel
    @Binding var navigationCoordinator: NavigationCoordinator
    
    var body: some View {
        NavigationStack(path: $navigationCoordinator.path) {
            if splashScreenIsActive {
                SplashScreen(splashScreenIsActive: $splashScreenIsActive)
            } else {
                HomeView(navigationCoordinator: $navigationCoordinator, gameViewModel: $viewModel)
            }
        }
    }
}

#Preview {
    CoordinatorView(viewModel: .constant(GameViewModel()), navigationCoordinator: .constant(NavigationCoordinator()))
}
