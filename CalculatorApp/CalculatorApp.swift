//
//  CalculatorAppApp.swift
//  CalculatorApp
//
//  Created by Kuba Kociucki on 23/10/2021.
//

import SwiftUI

@main
struct CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            CalculatorHome()
                .environmentObject(CalculatorModel())
        }
    }
}
