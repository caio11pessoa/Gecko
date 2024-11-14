//
//  CoordinatorView.swift
//  Gecko
//
//  Created by Caio de Almeida Pessoa on 14/11/24.
//

import SwiftUI

struct CoordinatorView: View {
    
    @Binding var viewModel: GameViewModel
    @Binding var navigationCoordinator: NavigationCoordinator
    
    var body: some View {
        NavigationStack(path: $navigationCoordinator.path) {
            if viewModel.splashScreenIsActive {
                SplashScreen(splashScreenIsActive: $viewModel.splashScreenIsActive)
            } else {
                HomeView(navigationCoordinator: $navigationCoordinator, gameViewModel: $viewModel)
            }
        }
    }
}

#Preview {
    CoordinatorView(viewModel: .constant(GameViewModel()), navigationCoordinator: .constant(NavigationCoordinator()))
}
