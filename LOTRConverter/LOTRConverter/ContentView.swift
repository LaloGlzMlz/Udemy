//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Eduardo Gonzalez Melgoza on 25/11/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    @State var showExchangeInfo: Bool = false
    @State var showSelectCurrentCurrency: Bool = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @FocusState var leftTyping: Bool
    @FocusState var rightTyping: Bool
    
    @State var leftCurrency: Currency = .copperPenny // default beginning values
    @State var rightCurrency: Currency = .silverPiece
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                HStack {
                    VStack {
                        HStack {
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .onTapGesture {
                            showSelectCurrentCurrency.toggle()
                        }
                        .popoverTip(currencyTip, arrowEdge: .bottom)
                        
                        
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                    }
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    VStack {
                        HStack {
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .onTapGesture {
                            showSelectCurrentCurrency.toggle()
                        }
                        
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .keyboardType(.decimalPad)
                
                Spacer()
                HStack {
                    Spacer()
                    
                    Button {
                        showExchangeInfo.toggle()
                        print("Show exchange info state: \(showExchangeInfo)")
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    .task {
                        try? Tips.configure()
                    }
                    .onChange(of: leftAmount) {
                        if leftTyping {
                            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                        }
                    }
                    .onChange(of: rightAmount) {
                        if rightTyping {
                            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                        }
                    }
                    .onChange(of: leftCurrency) {
                        leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                        currencyTip.invalidate(reason: .actionPerformed)
                    }
                    .onChange(of: rightCurrency) {
                        rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                    }
                    .sheet(isPresented: $showExchangeInfo) {
                        ExchangeInfo()
                    }
                    .sheet(isPresented: $showSelectCurrentCurrency) {
                        SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
