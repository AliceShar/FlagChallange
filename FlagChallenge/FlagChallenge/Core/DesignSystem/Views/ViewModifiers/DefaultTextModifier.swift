//
//  DefaultTextModifier.swift
//  FlagChallenge
//
//  Created by Alice Sharova on 23.01.2025.
//

import Foundation
import SwiftUI

struct DefaultTextViewModifier: ViewModifier {
    
    let size: TextSize
    let bold: Bool
    
    func body(content: Content) -> some View {
            content
            .foregroundStyle(Color.primaryColor)
                .font(selectFont(for: size))
                .bold(bold)
        }
        
    private func selectFont(for size: TextSize) -> Font {
            switch size {
            case .title:
                return .title
            case .title2:
                return .title2
            case .subheadline:
                return .subheadline
            }
        }

}

public enum TextSize {
    case title
    case title2
    case subheadline
}
