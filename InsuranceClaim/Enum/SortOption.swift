//
//  SortOption.swift
//  InsuranceClaim
//
//  Created by Ali Haidar on 4/22/25.
//

import Foundation

enum SortOption: String, CaseIterable, Identifiable {
    case claimIDAsc = "Claim ID ↑"
    case claimIDDesc = "Claim ID ↓"
    case claimantIDAsc = "Claimant ID ↑"
    case claimantIDDesc = "Claimant ID ↓"

    var id: String { self.rawValue }
}
