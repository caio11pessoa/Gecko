//
//  SplachScreen.swift
//  Gecko
//
//  Created by Caio de Almeida Pessoa on 14/11/24.
//

import SwiftUI
import RiveRuntime

struct SplashScreen: View {
    
    @StateObject var splashGecko = RiveViewModel(fileName: "SplashScreenGecko", fit: .contain, artboardName: "SlapshScreen 2")
    @Binding var splashScreenIsActive: Bool
    
    var body: some View {
        splashGecko.view()
            .ignoresSafeArea()
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.splashScreenIsActive = false
                    }
                }
            }
    }
}

#Preview {
    SplashScreen(splashScreenIsActive: .constant(true))
}
