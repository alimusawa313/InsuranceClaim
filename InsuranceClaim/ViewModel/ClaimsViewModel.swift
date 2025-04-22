//
//  ClaimsViewModel.swift
//  InsuranceClaim
//
//  Created by Ali Haidar on 4/22/25.
//

import Foundation

@MainActor
final class ClaimsViewModel: ObservableObject {
    @Published var claims: [Claim] = []
    @Published var searchText = ""
    @Published var isLoading = false
    @Published var errorMessage: String?

    var filteredClaims: [Claim] {
        if searchText.isEmpty {
            return claims
        }
        return claims.filter {
            $0.title.localizedCaseInsensitiveContains(searchText)
        }
    }

    func loadClaims() async {
        isLoading = true
        do {
            let data = try await ClaimService.shared.fetchClaims()
            claims = data
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}

