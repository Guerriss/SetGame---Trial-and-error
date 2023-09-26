//
//  SetGameApp.swift
//  SetGame
//
//  Created by Benedict Aleh Ogadinma on 11/07/23.
//

import SwiftUI

@main
struct SetGameApp: App {
    var body: some Scene {
        WindowGroup {
        let game = SetGameCard()
            SetGame(set: game)
        }
    }
}
