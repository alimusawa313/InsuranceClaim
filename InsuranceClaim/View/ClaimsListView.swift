//
//  ClaimsListView.swift
//  InsuranceClaim
//
//  Created by Ali Haidar on 4/22/25.
//

import SwiftUI

import SwiftUI

struct ClaimsListView: View {
    @StateObject private var viewModel = ClaimsViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading Claims...")
                } else if let error = viewModel.errorMessage {
                    Text(error).foregroundColor(.red)
                } else {
                    List(viewModel.filteredClaims) { claim in
                        NavigationLink(destination: ClaimDetailView(claim: claim)) {
                            VStack(alignment: .leading) {
                                Text(claim.title)
                                    .font(.headline)
                                Text(claim.body)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Insurance Claims")
            .searchable(text: $viewModel.searchText)
        }
        .task {
            await viewModel.loadClaims()
        }
        .alert(isPresented: .constant(viewModel.errorMessage != nil)) {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.errorMessage ?? ""),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    ClaimsListView()
}
