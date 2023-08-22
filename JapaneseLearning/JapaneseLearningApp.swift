//
//  JapaneseLearningApp.swift
//  JapaneseLearning
//
//  Created by Гаджи Герейакаев on 17.08.2023.
//

import SwiftUI

@main
struct JapaneseLearningApp: App {
    
    @StateObject private var dictionaryManager = DictionaryHiragana.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
                .environmentObject(dictionaryManager)
        }
    }
}
