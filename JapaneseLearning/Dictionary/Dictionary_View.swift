//
//  Dictionary_View.swift
//  JapaneseLearning
//
//  Created by Гаджи Герейакаев on 21.08.2023.
//

import SwiftUI

struct Dictionary_View: View {
    @EnvironmentObject private var dictionaryManager: DictionaryHiragana
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.23, green: 0.64, blue: 0.82).edgesIgnoringSafeArea(.top)
                VStack {
                    ScrollView(showsIndicators: false) {
                        VStack {
                            DictionaryRow(learn: "Изученные иероглифы", dict: dictionaryManager.currentDictionary.learnedHieroglyphs)
                            
                            DictionaryRow(learn: "Неизученные иероглифы", dict: dictionaryManager.currentDictionary.notLearnedHieroglyphs)

                        }
                    }
//                    Button {
//                        dictionaryManager.resetSettings()
//                    } label: {
//                        Text("Сброс")
//                    }
//                    .frame(width: 300, height: 40)
//                    .background(Color.gray)
                }
                
            }
            .navigationTitle("Словарь")
            .toolbar(.hidden, for: .navigationBar)
        }
        .environmentObject(DictionaryHiragana.shared)
        
    }
}


struct Dictionary_View_Previews: PreviewProvider {
    static var previews: some View {
        Dictionary_View()
            .environmentObject(DictionaryHiragana.shared)
    }
}
