//
//  ClaimsViewModel.swift
//  InsuranceClaim
//
//  Created by Ali Haidar on 4/22/25.
//

import Foundation
import Network

@MainActor
final class ClaimsViewModel: ObservableObject {
    @Published var claims: [Claim] = []
    @Published var searchText = ""
    @Published var sortOption: SortOption = .claimIDAsc
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var isConnected = true
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue.global(qos: .background)
    
    var filteredClaims: [Claim] {
        let filtered = searchText.isEmpty
        ? claims
        : claims.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        
        switch sortOption {
        case .claimIDAsc:
            return filtered.sorted { $0.id < $1.id }
        case .claimIDDesc:
            return filtered.sorted { $0.id > $1.id }
        case .claimantIDAsc:
            return filtered.sorted { $0.userId < $1.userId }
        case .claimantIDDesc:
            return filtered.sorted { $0.userId > $1.userId }
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
    
    func refreshClaims() {
        errorMessage = nil
        Task {
            if isConnected {
                await loadClaims()
            } else {
                errorMessage = "No internet connection."
            }
        }
    }
    
    func startNetworkMonitoring() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
    
    
}

