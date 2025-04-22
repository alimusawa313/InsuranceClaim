//
//  CustomAlertView.swift
//  InsuranceClaim
//
//  Created by Ali Haidar on 4/22/25.
//

import SwiftUI

struct CustomAlertView: View {
    let title: String
    let message: String
    let imageSystemName: String
    let onDismiss: () -> Void
    
    @State private var show = false
    
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: imageSystemName)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .foregroundColor(.green)
                .symbolEffect(.wiggle, options: .repeat(3).speed(3), value: show)
            
            Text(title)
                .font(.headline)
            
            Text(message)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Button("OK") {
                withAnimation {
                    show = false
                    onDismiss()
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 24)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).fill(.thinMaterial))
        .shadow(radius: 10)
        .padding(40)
        .transition(.scale.combined(with: .opacity))
        .onAppear {
            show = true
        }
    }
}

