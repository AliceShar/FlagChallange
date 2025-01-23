//
//  ChallengeView.swift
//  FlagChallenge
//
//  Created by Alice Sharova on 23.01.2025.
//

import SwiftUI

struct ChallengeView: View {
    
    @EnvironmentObject var challengeVM: ChallengeViewModel
    @EnvironmentObject var router: ChallengeRouter
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            
            getQuestionView()
        }
        .allowsHitTesting(!challengeVM.disabledView)
        .overlay(alignment: .top) {
            if let resultText = challengeVM.resultText {
                Text(resultText)
                    .font(.title)
                    .foregroundStyle(Color.primaryColor)
                    .multilineTextAlignment(.center)
            }
        }
        .onAppear {
            challengeVM.onAppear()
        }
        .navigationBarBackButtonHidden(true)
        .toolbarBackground(.hidden, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                BackButton {
                    router.navigateToRoot()
                    challengeVM.clearAll()
                }
            }
        }
    }
}

private extension ChallengeView {
    
    @ViewBuilder func getQuestionView() -> some View {
        VStack(alignment: .center) {
            Group {
                Text("What country is this flag?")
                    .bold()
                    .foregroundStyle(Color.backgroundModalColor)
                
                Text(challengeVM.correctCountry?.flag ?? "")
            }
            .font(.title)
            
            Spacer().frame(height: 40)
            
            ForEach(challengeVM.questionCountries.indices, id: \.self) { index in
                ChallengeButton(title: challengeVM.questionCountries[index]?.name ?? "") {
                    challengeVM.getAnswer(challengeVM.questionCountries[index]?.id ?? "")
                }
                .padding()
            }
        }
    }
}

#Preview {
    ChallengeView()
}
