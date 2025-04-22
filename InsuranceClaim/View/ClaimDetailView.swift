//
//  ClaimDetailView.swift
//  InsuranceClaim
//
//  Created by Ali Haidar on 4/22/25.
//

//
//  ClaimDetailView.swift
//  InsuranceClaim
//
//  Created by Ali Haidar on 4/22/25.
//

import SwiftUI

struct ClaimDetailView: View {
    let claim: Claim
    @State private var showCustomAlert = false

    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {

                    Text(claim.title)
                        .font(.title2)
                        .bold()

                    HStack {
                        Spacer()

                        Text("Claim ID: \(claim.id)")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity)

                        Divider()
                            .frame(height: 15)

                        Text("Claimant ID: \(claim.userId)")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity)

                        Spacer()
                    }
                    .padding(.vertical)
                    .background(Capsule().foregroundStyle(.thinMaterial))

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Description:")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        Text(claim.body)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).foregroundStyle(.thinMaterial))

                    Button(action: {
                        withAnimation {
                            showCustomAlert = true
                        }
                    }) {
                        Text("Mark as Reviewed")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.top)

                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Claim Detail")

            if showCustomAlert {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .transition(.opacity)

                CustomAlertView(
                    title: "Claim Reviewed",
                    message: "Claim ID \(claim.id) has been marked as reviewed.",
                    imageSystemName: "checkmark.seal.fill"
                ) {
                    showCustomAlert = false
                }
            }

        }
    }
}

#Preview {
    ClaimDetailView(claim: Claim(userId: 101, id: 2001, title: "Vehicle damage", body: "Hit from behind at a traffic light..."))
}
