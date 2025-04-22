//
//  ClaimDetailView.swift
//  InsuranceClaim
//
//  Created by Ali Haidar on 4/22/25.
//

import SwiftUI

struct ClaimDetailView: View {
    let claim: Claim

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Claim ID: \(claim.id)")
            Text("Claimant ID: \(claim.userId)")
            Text(claim.title)
                .font(.title2)
                .bold()
            Text(claim.body)
                .padding(.top, 5)
            Spacer()
        }
        .padding()
        .navigationTitle("Claim Detail")
    }
}


//#Preview {
//    ClaimDetailView()
//}
