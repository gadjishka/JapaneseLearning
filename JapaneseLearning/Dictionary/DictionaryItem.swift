//
//  DictionaryItem.swift
//  JapaneseLearning
//
//  Created by Гаджи Герейакаев on 21.08.2023.
//

import SwiftUI

struct DictionaryItem: View {
    
    public var item: String
    public var isEnable: Bool
    var body: some View {
        Button {
            //
        } label: {
            VStack {
                Image("hiragana-\(item)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                
                Text(item)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
            
        } .frame(width: 100, height: 130)
            .background(isEnable ? Color(red: 0.4627, green: 0.8392, blue: 1.0) : Color.gray)
            .cornerRadius(10)
            .padding(5)
        
    }
}

struct DictionaryItem_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryItem(item: "a", isEnable: false)
    }
}
