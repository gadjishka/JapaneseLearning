//
//  ContentView.swift
//  JapaneseLearning
//
//  Created by Гаджи Герейакаев on 17.08.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Group {
                MainMenu()
                    .tabItem {
                        Label("Тренировка", systemImage: "dumbbell")
                    }
                Dictionary_View()
                    .tabItem {
                        Label("Словарь", systemImage: "book")
                    }
            }
            
            .toolbarBackground(Color(red: 0.39, green: 0.62, blue: 0.82), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        }
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
