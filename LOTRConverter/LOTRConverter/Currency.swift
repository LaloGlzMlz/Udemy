//
//  Currency.swift
//  LOTRConverter
//
//  Created by Eduardo Gonzalez Melgoza on 17/01/25.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var id: Double { rawValue }
    
    var image: ImageResource {
        switch self {
        case .copperPenny:
                .copperpenny
        case .silverPenny:
                .silverpenny
        case .silverPiece:
                .silverpiece
        case .goldPenny:
                .goldpenny
        case .goldPiece:
                .goldpiece
        }
    }
    
    var name: String {
        switch self {
        case .copperPenny:
            "Copper Penny"
        case .silverPenny:
            "Silver Penny"
        case .silverPiece:
            "Silver Piece"
        case .goldPenny:
            "Gold Penny"
        case .goldPiece:
            "Gold Piece"
        }
    }
    
    func convert(_ amountToConvert: String, to currencyToConvertInto: Currency) -> String {
        guard let amountToConvertDouble = Double(amountToConvert) else {
            return ""
        }
        
        let convertedAmount = (amountToConvertDouble / self.rawValue) * currencyToConvertInto.rawValue
        
        return String(format: "%.2f", convertedAmount)
    }
}

