//
//  ChallengeButton.swift
//  FlagChallenge
//
//  Created by Alice Sharova on 23.01.2025.
//

import SwiftUI

struct ChallengeButton: View {
    let title: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .foregroundColor(Color.primaryColor)
                .frame(maxWidth: .infinity)
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    ChallengeButton(title: "Title", action: {})
}
