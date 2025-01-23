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
    @Published private(set) var shuffledQuestionCountries: [CountryModel?] = []
    @Published private(set) var result: [CountryModel?] = []
    @Published private(set) var resultText: String?
    @Published private(set) var disabledView: Bool = false
    
    @Published private(set) var correctAnswers: Int = 0
    @Published private(set) var wrongAnswers: Int = 0
    @Published private(set) var goBack: Bool = false
    
    // Stored properties
    private let countriesManager: CountriesHelper
    private var historyArray: [CountryModel] = []
    private var correctAnswersHistory: Int = 0
    private var wrongAnswersHistory: Int = 0
    
    init(countriesManager: CountriesHelper) {
        self.countriesManager = countriesManager
    }
    
    // Public methods
    func clearAll() {
        wrongCountry = nil
        correctCountry = nil
        shuffledQuestionCountries = []
        historyArray = []
        resultText = nil
        correctAnswersHistory = 0
        wrongAnswersHistory = 0
    }
    
    func onAppear() {
        disabledView = false
        clearAll()
        getQuestion()
    }
    
    func getAnswer(_ id: String) {
        disabledView = true
        if id == correctCountry?.id {
            getResultText(true)
        } else {
            getResultText(false)
        }
    }
    
    // Private methods
    private func getQuestion() {
        guard historyArray.count != 5 else {
            showScoreAndGoBack()
            return
        }
        shuffledQuestionCountries = []
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
        
        let questionCountries = [correctCountry, wrongCountry].compactMap { $0 }
        shuffledQuestionCountries = questionCountries.shuffled()
    }
    
    private func showScoreAndGoBack() {
        correctAnswers = correctAnswersHistory
        wrongAnswers = wrongAnswersHistory
        clearAll()
        goBack = true
        goBack = false
    }
    
    private func getResultText(_ correct: Bool) {
        if correct {
            resultText = "Success. Well done!"
            correctAnswersHistory += 1
        } else {
            resultText = "It's wrong. You can do better!"
            wrongAnswersHistory += 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.resultText = nil
            self?.disabledView = false
            self?.getQuestion()
        }
    }
}
