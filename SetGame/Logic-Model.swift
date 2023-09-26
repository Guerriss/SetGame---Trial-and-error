//
//  Logic-Model.swift
//  SetGame
//
//  Created by Benedict Aleh Ogadinma on 13/07/23.
//

import Foundation
struct GameLogic<SetContent> where SetContent: Equatable {
    
    private(set) var cards: Array<Card>
//    private var CartaScelta: (first: Int?, second: Int?, third: Int?)? = nil
    private var selectedCards: [Card] = []
 

    mutating func ChooseCard(_ card: Card){
        if let chooseIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chooseIndex].isChosen,
           !cards[chooseIndex].isMatched {
            
            // Logic for handling card selection and matching
            if selectedCards.count < 2 {
                cards[chooseIndex].isChosen.toggle()
                selectedCards.append(cards[chooseIndex])
                
                if selectedCards.count == 3 {
                    if selectedCards[0].Content == selectedCards[1].Content &&
                       selectedCards[0].Content == selectedCards[2].Content {
                        selectedCards.forEach { cards[$0.id].isMatched = true }
                    }
                    selectedCards.removeAll()
                }
            } else {
                // Deselect previously selected cards
                selectedCards.forEach { cards[$0.id].isChosen = false }
                selectedCards.removeAll()
                
                cards[chooseIndex].isChosen.toggle()
                selectedCards.append(cards[chooseIndex])
            }
        }
        print("chosen card\(cards)")
    }
    /*
   //sempre stessa logica solo che l'ho adattata a 3 carte - TRUE
    mutating func ChooseCard(_ card: Card){
        if let chooseIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chooseIndex].isChosen,
           !cards[chooseIndex].isMatched{
            if let secondChosenIndex = CartaScelta?.second,
               let firstChosenIndex = CartaScelta?.first {
                if cards[chooseIndex].Content == cards[firstChosenIndex].Content &&
                    cards[chooseIndex].Content == cards[secondChosenIndex].Content {
                    cards[chooseIndex].isMatched = true
                    cards[firstChosenIndex].isMatched = true
                    cards[secondChosenIndex].isMatched = true
                }
                CartaScelta = nil
            } else {
                for index in cards.indices {
                    cards[index].isChosen = false
                }
                CartaScelta = (chooseIndex, nil, nil)
            }
            cards[chooseIndex].isChosen.toggle()
        }
        print("chosen card\(cards)")
    }
    
     */
    
    init(NumberCardsViewd: Int, createCardContent: (Int) -> SetContent) {
        cards = Array<Card>() //crea un array di carte vuoto
        for pairIndex in 0..<NumberCardsViewd{
            //aggiungo le carte dentro all'array
            let content = createCardContent(pairIndex) //crea il content delle due righe qui sotto, e questa funzione deve essere inserita per forza tra gli argomenti nell'init
            cards.append(Card(Content: content, id: pairIndex*2))
            cards.append(Card(Content: content, id: pairIndex*2+1))
            cards.append(Card(Content: content, id: pairIndex*2+2))
            //da rivedere questa parte, lezione 3, in modo da capirla bene
        }
    }
    
    
    
    struct Card: Identifiable {
        var isMatched: Bool = false
        var isChosen: Bool = false
        var Content: SetContent
        var id: Int
    }
}


/*
 Appunti:
 20/07
 
 Grazie all'utilizzo di ChatGPT e in parte di Bard - anche se in realtà, la prova che ho fatto con lui mi ha fatto capire che per ora bard
 può essere usato solo per le ricerche online non per altra roba, magari tra 1 mesetto - comunque si ho utilizzato GPT per chiedergli quale potrebbe essere la soluzione per adattare la logica da 2 a 3 carte, l'unico problema è che non funziona la view.
 
 Nel senso che ontap funziona sembrerebbe, ma non spariscono se ne matcho 3 uguali - questo lo sto scrivendo alle 15:43, ora vediamo cosa riesco a fare e farò un ultimo check stasera forse.
 
 Non riesco a capire dove sta il problema, secondo me il problema è nella view, ovvero che non riusciamo a passargli il fatto che utilizzamo una cosa a 3 invece che a 2.
 */
