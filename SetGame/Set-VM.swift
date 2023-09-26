//
//  Set-VM.swift
//  SetGame
//
//  Created by Benedict Aleh Ogadinma on 13/07/23.
//

import SwiftUI

class SetGameCard: ObservableObject{
    
    static let card = ["😀","😃","😄"].shuffled()
    
    static func CreateGame() -> GameLogic<String> {
        GameLogic<String>(NumberCardsViewd: 3){
            pairIndex in card[pairIndex]
        }
    }
    
    @Published private var Logica: GameLogic<String> = CreateGame()
    
    var cards: Array<GameLogic<String>.Card>{
        Logica.cards
    }

    //Intenti
    func ChooseCard(_ card: GameLogic<String>.Card){
        Logica.ChooseCard(card)
    }
    
}
