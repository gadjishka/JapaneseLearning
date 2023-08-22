//
//  DictionaryRow.swift
//  JapaneseLearning
//
//  Created by Гаджи Герейакаев on 21.08.2023.
//

import SwiftUI

struct DictionaryRow: View {
    @EnvironmentObject private var dictionaryManager: DictionaryHiragana
    
    public var learn: String
    public var dict: [Hieroglyph]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(learn)
                .font(.headline)
                .padding(.leading, 7)
            ForEach(0..<dict.count/3 + 1, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(0..<3) { column in
                        let index = row * 3 + column
                        if index < dict.count {
                            DictionaryItem(item: dict[index])
                                
                        } else {
                            Spacer()
                        }
                    }
                }.frame(width: 350)
            }
        }
        .padding()
        .environmentObject(DictionaryHiragana.shared)
        
        
    }
}

struct DictionaryRow_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryRow(learn: "Изученные иероглифы", dict: DictionaryHiragana.shared.currentDictionary.learnedHieroglyphs)
            .environmentObject(DictionaryHiragana.shared)
    }
}
