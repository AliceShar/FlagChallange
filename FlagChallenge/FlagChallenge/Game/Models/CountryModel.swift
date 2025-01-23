//
//  CountryModel.swift
//  FlagChallenge
//
//  Created by Alice Sharova on 23.01.2025.
//

import Foundation

struct CountryModel: Identifiable, Equatable {
    let id: String = UUID().uuidString
    let name: String?
    let flag: String?
    
    static func == (lhs: CountryModel, rhs: CountryModel) -> Bool {
          return lhs.id == rhs.id
      }
}
