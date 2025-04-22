//
//  ClaimService.swift
//  InsuranceClaim
//
//  Created by Ali Haidar on 4/22/25.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL, requestFailed, decodingFailed

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .requestFailed: return "Failed to fetch data"
        case .decodingFailed: return "Failed to decode data"
        }
    }
}

final class ClaimService {
    static let shared = ClaimService()

    func fetchClaims() async throws -> [Claim] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            throw NetworkError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        guard let claims = try? JSONDecoder().decode([Claim].self, from: data) else {
            throw NetworkError.decodingFailed
        }

        return claims
    }
}

