//
//  DictionaryItem.swift
//  JapaneseLearning
//
//  Created by Гаджи Герейакаев on 21.08.2023.
//

import SwiftUI

struct DictionaryItem: View {
    @EnvironmentObject private var dictionaryManager: DictionaryHiragana
    
    public var item: Hieroglyph
    
    var body: some View {
        NavigationLink {
            DictionaryDetailView(item: item)
        } label: {
            VStack {
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                
                Text(item.pronunciation)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
            
        } .frame(width: 100, height: 130)
            .background(item.learned ? Color(red: 0.4627, green: 0.8392, blue: 1.0) : Color.gray)
            .cornerRadius(10)
            .padding(5)
            .environmentObject(DictionaryHiragana.shared)
        
    }
}

struct DictionaryItem_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryItem(item: Hieroglyph(pronunciation: "a", image: "hiragana-a"))
            .environmentObject(DictionaryHiragana.shared)
    }
}
