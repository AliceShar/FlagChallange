//
//  ChallengeViewModel.swift
//  FlagChallenge
//
//  Created by Alice Sharova on 23.01.2025.
//

import Foundation

@MainActor
final class ChallengeViewModel: ObservableObject {
    
    // Published properties
    @Published private(set) var wrongCountry: CountryModel?
    @Published private(set) var correctCountry: CountryModel?
    @Published private(set) var questionCountries: [CountryModel?] = []
    @Published private(set) var result: [CountryModel?] = []
    @Published private(set) var resultText: String?
    
    // Stored properties
    private let countriesManager: CountriesHelper
    
    private var historyArray: [CountryModel] = []
    @Published private(set) var correctAnswers: Int = 0
    @Published private(set) var wrongAnswers: Int = 0
    
    init(countriesManager: CountriesHelper) {
        self.countriesManager = countriesManager
    }
    
    func getQuestion() {
        let countriesList = countriesManager.retrieveCountriesList()
        let availableCountries = countriesList.filter { !historyArray.contains($0) }
        
        guard !availableCountries.isEmpty else {
            return
        }
        
        guard let randomCountry = availableCountries.randomElement() else { return }
        historyArray.append(randomCountry)
        correctCountry = randomCountry
        
        var wrongCountryCandidate: CountryModel?
        repeat {
            wrongCountryCandidate = countriesList.randomElement()
        } while wrongCountryCandidate == correctCountry
        wrongCountry = wrongCountryCandidate
        
        questionCountries.append(contentsOf: [correctCountry, wrongCountry])
    }
    
    func getAnswer(_ id: String) {
        if id == correctCountry?.id {
            getResultText(true)
        } else {
            getResultText(false)
        }
    }
    
    private func getResultText(_ correct: Bool) {
        if correct {
            resultText = "Success. Well done!"
            correctAnswers += 1
        } else {
            resultText = "It's wrong. You can do better!"
            wrongAnswers += 1
        }
        
    }
    
    func clearAll() {
        wrongCountry = nil
        correctCountry = nil
        questionCountries = []
        historyArray = []
        resultText = nil
        correctAnswers = 0
        wrongAnswers = 0
    }
}
