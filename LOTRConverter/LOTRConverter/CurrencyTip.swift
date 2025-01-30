//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Eduardo Gonzalez Melgoza on 21/01/25.
//

import TipKit

struct CurrencyTip: Tip {
    var title: Text = Text("Change currency")
    
    var message: Text? = Text("You can tap on the left or right currency icons to bring up the currency picker.")
    
    var image: Image? = Image(systemName: "hand.tap.fill")
    
}
