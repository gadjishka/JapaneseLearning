//
//  Dictionary_View.swift
//  JapaneseLearning
//
//  Created by Гаджи Герейакаев on 21.08.2023.
//

import SwiftUI

struct Dictionary_View: View {
    private var dictLearn = ["a", "o", "wa", "n", "ka", "ki", "e"]
    private var dictNoLearn = ["ri", "ro", "ru", "mo", "mu", "na", "ne"]
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.23, green: 0.64, blue: 0.82).edgesIgnoringSafeArea(.top)
                ScrollView(showsIndicators: false) {
                    VStack {
                        DictionaryRow(learn: "Изученные иероглифы", dict: dictLearn, isEnable: true)
                        DictionaryRow(learn: "Неизученные иероглифы", dict: dictNoLearn, isEnable: false)

                    }
                }
            }
            
            
            .navigationTitle("Словарь")
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}


struct Dictionary_View_Previews: PreviewProvider {
    static var previews: some View {
        Dictionary_View()
    }
}
