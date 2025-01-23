//
//  ChallengeViewModel.swift
//  FlagChallenge
//
//  Created by Alice Sharova on 23.01.2025.
//

import Foundation

@MainActor
final class ChallengeViewModel: ObservableObject {
    
    private let countriesManager: CountriesHelper
    
    // Published properties
    @Published private(set) var wrongCountry: CountryModel?
    @Published private(set) var correctCountry: CountryModel?
    
    private var historyArray: [CountryModel] = []
    
    init(countriesManager: CountriesHelper) {
        self.countriesManager = countriesManager
    }
    
    func getQuestion() {
        
    }
    
}
