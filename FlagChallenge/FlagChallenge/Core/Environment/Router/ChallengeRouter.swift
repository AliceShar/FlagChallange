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
    
    func navigate(to destination: DetailsDestination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
    
//    @ViewBuilder func navigateBetweenViews (value: ProfileDestination) -> some View {
//        switch value {
//        case .details:
//            break
//        }
//    }
}

public enum DetailsDestination: Codable, Hashable {
    case game
}
