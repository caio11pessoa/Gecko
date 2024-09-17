//  Created by Caio de Almeida Pessoa on 30/08/24.
//

import SwiftUI

@main
struct GeckoApp: App {
    @State var viewModel: GameViewModel = GameViewModel()
    @State var navigationCoordinator: NavigationCoordinator = NavigationCoordinator()
    var body: some Scene {
        WindowGroup {
            HomeView(navigationCoordinator: $navigationCoordinator, gameViewModel: $viewModel)
                .preferredColorScheme(.light)
        }
    }
}
