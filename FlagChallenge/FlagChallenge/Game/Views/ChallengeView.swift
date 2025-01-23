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
        .onAppear {
            challengeVM.getQuestion()
        }
        .navigationBarBackButtonHidden(true)
        .toolbarBackground(.hidden, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                BackButton {
                    router.navigateToRoot()
                }
            }
        }
    }
}

private extension ChallengeView {
    
    @ViewBuilder func getQuestionView() -> some View {
        HStack(alignment: .center) {
            Text("What country is this flag?")
            
            Text(<#T##attributedContent: AttributedString##AttributedString#>)
        }
    }
}

#Preview {
    ChallengeView()
}
