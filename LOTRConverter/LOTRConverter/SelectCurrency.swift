//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Eduardo Gonzalez Melgoza on 09/01/25.
//

import Foundation
import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                Text("Select the currency you are starting with: ")
                    .fontWeight(.bold)
                
                IconGrid(selectedCurrency: $topCurrency)
                
                
                Text("Select the currency you would like to convert to: ")
                    .fontWeight(.bold)
                    .padding(.top)
                
                IconGrid(selectedCurrency: $bottomCurrency)
                
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    
    @Previewable @State var topCurrency: Currency = .silverPiece
    @Previewable @State var bottomCurrency: Currency = .silverPenny
    
    SelectCurrency(topCurrency: $topCurrency, bottomCurrency: $bottomCurrency)
}
