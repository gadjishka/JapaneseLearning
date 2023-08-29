//
//  QuestionModel.swift
//  JapaneseLearning
//
//  Created by Гаджи Герейакаев on 24.08.2023.
//

import Foundation

enum QuestionType: String, CaseIterable {
    case hieroglyph = "Как читается данный иероглиф?"
    case pronunciation = "Какой иероглиф читается так:"
}

class TrainingViewModel: ObservableObject {
    
    static let shared = TrainingViewModel()
    
    @Published var currentWord: Hieroglyph = Hieroglyph(pronunciation: "a", image: "hiragana-a")
    @Published var questionType: QuestionType = .hieroglyph
    @Published var buttonLabels: [Hieroglyph] = []
    @Published var correctButtonIndex: Int = 0
    @Published var choosenCard: Int? = nil
    
    @Published var allWords: [Hieroglyph] = []
    @Published var learnedWords: [Hieroglyph] = []

    
    func startTraining() {
        refreshContent()
    }
    
    func checkAnswer(index: Int) -> Bool{
        if index == correctButtonIndex {
            refreshContent()
            return false
        }
        else {
            choosenCard = nil
            return true
        }
        
        
    }
    
    private func refreshContent() {
        if let randomType = QuestionType.allCases.randomElement() {
            questionType = randomType
        }
        
        if let currentWordtest = learnedWords.randomElement() {
            currentWord = currentWordtest
        }
        let uniqueWords = randomUniqueElements(array: allWords.filter { $0 != currentWord })
        buttonLabels = uniqueWords.prefix(3) + [currentWord]
        buttonLabels.shuffle()
        
        correctButtonIndex = buttonLabels.firstIndex(of: currentWord) ?? 0
        
        choosenCard = nil
    }

    
    private func randomUniqueElements( array: [Hieroglyph]) -> [Hieroglyph] {
        let count = 4
        
        var copyArray = array
        var result: [Hieroglyph] = []
        
        while result.count < count {
            let randomIndex = Int.random(in: 0..<copyArray.count)
            result.append(copyArray.remove(at: randomIndex))
        }
        
        return result
    }
    
}
