//
//  StartView.swift
//  FlagChallenge
//
//  Created by Alice Sharova on 23.01.2025.
//

import SwiftUI

struct StartView: View {
    
    @StateObject private var challengeVM: ChallengeViewModel
    @StateObject private var router = ChallengeRouter()
    
    init(countriesManager: CountriesHelper) {
        _challengeVM = StateObject(wrappedValue: ChallengeViewModel(countriesManager: countriesManager))
    }
    
    var body: some View {
        NavigationStack(path: $router.navPath) {
            ZStack {
                Color.backgroundColor.ignoresSafeArea()
                
                VStack {
                    Text("Welcome! \nYou got into the game of countries and flags. Press the button to start the challenge")
                        .font(.title)
                        .foregroundStyle(Color.primaryColor)
                        .multilineTextAlignment(.center)
                    
                    Spacer().frame(height: 100)
                    
                    startButton()
                }
                .padding(.horizontal, 20)
            }
            .navigationDestination(for: ChallengeDestination.self) { value in
                router.navigateBetweenViews(value: value)
            }
        }
        .environmentObject(challengeVM)
        .environmentObject(router)
    }
}

private extension StartView {
    
    // Navigate to the game
    private func startButton() -> some View {
        PrimaryButton(title: "Start Challenge", action: {
            router.navigate(to: .challenge)
        })

    }
}

#Preview {
    StartView(countriesManager: CountriesHelper())
}
