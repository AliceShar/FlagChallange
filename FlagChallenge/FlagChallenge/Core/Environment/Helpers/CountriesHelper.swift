//
//  CountriesHelper.swift
//  FlagChallenge
//
//  Created by Alice Sharova on 23.01.2025.
//

import Foundation

final class CountriesHelper {

    private var countriesList: [CountryModel] = []
    
    func retrieveCountriesList() -> [CountryModel]? {
        return countriesList
    }
    
    public init() {
        setupCountriesList()
    }
    
    private func setupCountriesList() {
        let predefinedCountries: [CountryModel] = [
            CountryModel(name: "Ukraine", flag: "🇺🇦"),
            CountryModel(name: "Canada", flag: "🇨🇦"),
            CountryModel(name: "Poland", flag: "🇵🇱"),
            CountryModel(name: "USA", flag: "🇺🇸"),
            CountryModel(name: "Thailand", flag: "🇹🇭"),
            CountryModel(name: "Brazil", flag: "🇧🇷"),
            CountryModel(name: "Bulgaria", flag: "🇧🇬"),
            CountryModel(name: "Cambodia", flag: "🇰🇭"),
            CountryModel(name: "Cameroon", flag: "🇨🇲"),
            CountryModel(name: "Nigeria", flag: "🇳🇬"),
            CountryModel(name: "Kuwait", flag: "🇰🇼"),
            CountryModel(name: "Mali", flag: "🇲🇱"),
            CountryModel(name: "Jamaica", flag: "🇯🇲"),
            CountryModel(name: "Austria", flag: "🇦🇹")
        ]
        countriesList = predefinedCountries
    }

}
