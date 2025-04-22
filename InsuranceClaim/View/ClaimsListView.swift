//
//  ClaimsListView.swift
//  InsuranceClaim
//
//  Created by Ali Haidar on 4/22/25.
//

import SwiftUI

struct ClaimsListView: View {
    @StateObject private var viewModel = ClaimsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                Group {
                    if viewModel.isLoading {
                        ProgressView("Loading Claims...")
                    } else if let error = viewModel.errorMessage {
                        Text(error).foregroundColor(.red)
                    } else {
                        List {
                            Picker("Sort by", selection: $viewModel.sortOption) {
                                ForEach(SortOption.allCases) { option in
                                    Text(option.rawValue).tag(option)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            
                            ForEach(viewModel.filteredClaims) { claim in
                                NavigationLink(destination: ClaimDetailView(claim: claim)) {
                                    ClaimRowView(claim: claim)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Insurance Claims")
                .searchable(text: $viewModel.searchText)
                
            }
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
