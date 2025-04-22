//
//  Claim.swift
//  InsuranceClaim
//
//  Created by Ali Haidar on 4/22/25.
//

import Foundation

struct Claim: Identifiable, Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

