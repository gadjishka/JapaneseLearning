//
//  DictionaryDetailView.swift
//  JapaneseLearning
//
//  Created by Гаджи Герейакаев on 21.08.2023.
//

import SwiftUI

struct DictionaryDetailView: View {
    @EnvironmentObject private var dictionaryManager: DictionaryHiragana
    @State var item: Hieroglyph // Подставьте нужный тип данных
    
   
    
    var body: some View {
        ZStack {
            Color(red: 0.23, green: 0.64, blue: 0.82).edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) { // Убрано spacing: 30
                Button {
                    //
                } label: {
                    Image(item.image)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .background(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding(.bottom, 10)
                }
                
                
                
                Text(item.pronunciation)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(width: 100, height: 50, alignment: .center)
                    
                    .padding(.top, 100) // Отступ вниз от текста
                
                Text(item.usageExamples != nil ? item.usageExamples! : "Пока примеров применения иероглифа нет, заходите чуть позже")
                    .font(.callout)
                    .padding()

                Spacer()
                
                Button {
                    dictionaryManager.addHierogliph(hieroglyph: item)
                    item.learnHieroglyph()
                } label: {
                    
                    ZStack {
                        Text("Добавить")
                            .font(.title3)
                            .foregroundColor(.white)
                        
                        Color.clear
                            .contentShape(Rectangle())
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(item.learned ? Color.gray : Color.green)
                .cornerRadius(10)
                .shadow(radius: 7)
                .padding()
                .disabled(item.learned)
            }
        }
    }
}


struct DictionaryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryDetailView(item: Hieroglyph(pronunciation: "a", image: "hiragana-a"))
    }
}
