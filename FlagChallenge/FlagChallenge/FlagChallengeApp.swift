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
    let countriesManager: CountriesHelper = CountriesHelper()
    
    var body: some Scene {
        WindowGroup {
            StartView(countriesManager: countriesManager)
        }
    }
}
