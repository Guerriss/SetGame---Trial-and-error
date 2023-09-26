//
//  ContentView.swift
//  SetGame
//
//  Created by Benedict Aleh Ogadinma on 11/07/23.
//
/* passaggi da segnare
 Non usiamo quelle carte lì perché c'è troppo sbattimento per niente secondo me, quindi usiamo 3 emoji :
    😀😃😄 -> si vince se si prendono tutte e 3 in questa combinazione, o 3 uguali. Max 21, parte da poche e poi con un bottone aumenta
 1: decidere figure da utilizzare per il gioco
 2: setto le carte nella visuale
 3: aggiungo il bottone
 4: faccio funzionare tutto lo shuffle in modo casuale una volta schiacciato il bottone
 5: implemento il touch di ogni carta e creo una base per la logica del gioco
 6: da questa base qui, parto e seguo le istruzioni facendo cazzi e mazzi*/
import SwiftUI

struct SetGame: View {
    
    @ObservedObject var set: SetGameCard
    
    var body: some View{
        VStack {
            Text("Set Game")
                .font(.title)
                .fontWeight(.bold)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(set.cards){
                        card in
                        CardView(cards: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                            set.ChooseCard(card)
                        }
                    }
                }
            }
    //        .foregroundColor()
        }
    }
}






/*
 13/07
 
 Nel VM creo la funzione che fa partire il gioco e nel M la inizializzo settando effettivamente le carte nel dislpay e nella view passo i dati e mostro tutto.
 
 14/07
 
 Ora super produttiva, ho implementato tutti i collegamenti tra V VM e M, il problema è che mi da l'errore sulla strutta CardView, di preciso sull'argomento che gli ho passato "card", non so perché il programma dovrei averlo fatto giusto, semmai si cerca su internet o chatgpt -  errore risolto grazie a chatGPT, è un gamechanger e con la mia startup mia aiuterà un casino, devo solo imparare ad usarlo nel migliore dei modi
 
 Il problema è che ora, ogni volta che lo faccio partire mi da un bug, ensomma
 
 
 15/07
 
 Ho fatto tutto il funzionamento base del gioco a 2 scelte, ora devo modificare la logica in modo da fare il gioco a 3 scelte e una volta fatto questo posso iniziare con le richieste del prof nelle task, vediamo se farlè tutte o no.
 
 Direi giornata bella produttiva, devo inoltre rivedere un paio di spiegazioni del codice, ma nulla di problematico, solo qualche chiarimento, in generale apposto.
 
 Facessi 2/3 ore al giorno così sarebbe tanta tanta roba, vediamo ad agosto se si riescono a tirare fuori, o comunque almeno 10/14 ora a settimana
 */





struct CardView: View {
    
    let cards: GameLogic<String>.Card
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 020)
            if cards.isChosen
            {
                shape.fill().foregroundColor(.red)
                Text(cards.Content).font(.largeTitle)
            }
            else if cards.isMatched
            {
                shape.opacity(0)
            }
            else{
                shape.fill()
                Text(cards.Content).font(.largeTitle)
            }
        }
    }
}










































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameCard()
        SetGame(set: game)
    }
}





