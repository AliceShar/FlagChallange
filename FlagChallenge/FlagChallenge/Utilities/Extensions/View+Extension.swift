//
//  View+Extension.swift
//  FlagChallenge
//
//  Created by Alice Sharova on 23.01.2025.
//

import Foundation
import SwiftUI

extension View {
    
    func withDefaultTextFormatting(textSixe: TextSize, isBold: Bool) -> some View {
       modifier(DefaultTextViewModifier(size: textSixe, bold: isBold))
    }
}
