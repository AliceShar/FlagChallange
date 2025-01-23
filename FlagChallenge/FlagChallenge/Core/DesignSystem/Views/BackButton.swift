//
//  BackButton.swift
//  FlagChallenge
//
//  Created by Alice Sharova on 23.01.2025.
//

import SwiftUI

struct BackButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "arrow.backward").bold()
                .foregroundStyle(Color.primaryColor)
        }
        .font(.headline)
    }
}

#Preview {
    BackButton(action: {})
}
