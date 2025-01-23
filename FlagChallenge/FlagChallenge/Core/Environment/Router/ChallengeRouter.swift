//
//  ChallengeRouter.swift
//  FlagChallenge
//
//  Created by Alice Sharova on 23.01.2025.
//

import Foundation
import SwiftUI

final class ChallengeRouter: ObservableObject, NavigationProtocol {
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: ChallengeDestination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
    
    @ViewBuilder func navigateBetweenViews (value: ChallengeDestination) -> some View {
        switch value {
        case .challenge:
            ChallengeView()
        }
    }
}

public enum ChallengeDestination: Codable, Hashable {
    case challenge
}
