//
//  ContentView.swift
//  Memorize
//
//  Created by Samuel Piecz on 2/14/21.
//

import SwiftUI

struct ContentView: View {
    // Don't actually call it viewModel, call it something
    // more descriptive as to the name of the class.
    // viewModel helps elaborate framework basics initially.
    // Easier to understand what class is doing what part.
    // Same can be said in EmojiMemoryGame.swift where a
    // var is called model, wouldn't normally be called
    // model, would maybe called memoryGame or something.
    var viewModel: EmojiMemoryGame
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(.orange)
            .font(Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
