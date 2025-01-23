//
//  FlagChallengeApp.swift
//  FlagChallenge
//
//  Created by Alice Sharova on 23.01.2025.
//

import SwiftUI

@main
struct FlagChallengeApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            StartView()
        }
    }
}
