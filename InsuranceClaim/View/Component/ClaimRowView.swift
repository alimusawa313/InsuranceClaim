//
//  ClaimRowView.swift
//  InsuranceClaim
//
//  Created by Ali Haidar on 4/22/25.
//

import SwiftUI

struct ClaimRowView: View {
    let claim: Claim
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(claim.title)
                .font(.headline)
                .bold()
            
            Text(claim.body)
                .lineLimit(2)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack {
                Spacer()
                Text("Claim ID: \(claim.id)")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
                
                
                Divider().frame(height: 10)
                
                
                Text("Claimant ID: \(claim.userId)")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
                
                Spacer()
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ClaimRowView(claim: Claim(userId: 101, id: 2001, title: "Vehicle damage", body: "Hit from behind at a traffic light..."))
}
