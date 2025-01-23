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
                        .padding(.bottom, 20)
                    
                    if challengeVM.correctAnswers != 0 || challengeVM.wrongAnswers != 0 {
                        Text("Last game results:")
                            .font(.title2)
                            .foregroundStyle(Color.primaryColor)
                            .multilineTextAlignment(.center)
                        
                        Text("Correct: \(challengeVM.correctAnswers)")
                            .font(.headline)
                            .foregroundStyle(Color.greenColor)
                            .multilineTextAlignment(.center)
                        
                        Text("Wrong: \(challengeVM.wrongAnswers)")
                            .font(.headline)
                            .foregroundStyle(Color.destructiveColor)
                            .multilineTextAlignment(.center)
                    }
                    
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
