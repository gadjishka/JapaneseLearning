//
//  DictionaryRow.swift
//  JapaneseLearning
//
//  Created by Гаджи Герейакаев on 21.08.2023.
//

import SwiftUI

struct DictionaryRow: View {
    public var learn: String
    public var dict: [String]
    public var isEnable: Bool
    
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
                            DictionaryItem(item: dict[index], isEnable: isEnable)
                        } else {
                            Spacer()
                        }
                    }
                }.frame(width: 350)
            }
        }
        .padding()
    }
}

struct DictionaryRow_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryRow(learn: "Изученные иероглифы", dict: ["a", "o", "wa"], isEnable: true)
    }
}
