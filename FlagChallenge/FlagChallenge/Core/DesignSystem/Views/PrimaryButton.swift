//
//  PrimaryButton.swift
//  FlagChallenge
//
//  Created by Alice Sharova on 23.01.2025.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .frame(height: 50)
                .font(.headline)
                .multilineTextAlignment(.center)
        }
        .buttonStyle(MyButtonStyle())
    }
}

fileprivate struct MyButtonStyle: ButtonStyle {

  func makeBody(configuration: Self.Configuration) -> some View {
      configuration.label
          .foregroundColor(configuration.isPressed ? Color.secondaryColor : Color.backgroundColor)
          .frame(maxWidth: .infinity)
          .background(Color.backgroundModalColor)
          .clipShape(RoundedRectangle(cornerRadius: 20))
  }
}

#Preview {
    PrimaryButton(title: "Title", action: {})
}
