//
//  HieroglyphModel.swift
//  JapaneseLearning
//
//  Created by Гаджи Герейакаев on 21.08.2023.
//

import Foundation

struct Hieroglyph {
    var pronunciation: String
    var image: String
    var usageExamples: String?
    var learned: Bool = false
    
    init(pronunciation: String, image: String, usageExamples: String? = nil, learned: Bool = false) {
        self.pronunciation = pronunciation
        self.image = image
        self.usageExamples = usageExamples
        self.learned = learned
    }
    
    mutating func learnHierogliph() {
        self.learned = true
    }
}
