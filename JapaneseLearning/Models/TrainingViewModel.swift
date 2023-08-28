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
    
    private let words: [Hieroglyph] = [
        Hieroglyph(pronunciation: "a", image: "hiragana-a"),
        Hieroglyph(pronunciation: "chi", image: "hiragana-chi"),
        Hieroglyph(pronunciation: "e", image: "hiragana-e"),
        Hieroglyph(pronunciation: "fu", image: "hiragana-fu"),
        Hieroglyph(pronunciation: "ha", image: "hiragana-ha"),
        Hieroglyph(pronunciation: "he", image: "hiragana-he"),
        Hieroglyph(pronunciation: "hi", image: "hiragana-hi"),
        Hieroglyph(pronunciation: "ko", image: "hiragana-ho"),
        Hieroglyph(pronunciation: "i", image: "hiragana-i"),
        Hieroglyph(pronunciation: "ka", image: "hiragana-ka"),
        Hieroglyph(pronunciation: "ke", image: "hiragana-ke"),
        Hieroglyph(pronunciation: "ki", image: "hiragana-ki"),
        Hieroglyph(pronunciation: "ko", image: "hiragana-ko"),
        Hieroglyph(pronunciation: "ku", image: "hiragana-ku"),
        Hieroglyph(pronunciation: "ma", image: "hiragana-ma"),
        Hieroglyph(pronunciation: "me", image: "hiragana-me"),
        Hieroglyph(pronunciation: "mi", image: "hiragana-mi"),
        Hieroglyph(pronunciation: "mo", image: "hiragana-mo"),
        Hieroglyph(pronunciation: "mu", image: "hiragana-mu"),
        Hieroglyph(pronunciation: "n", image: "hiragana-n"),
        Hieroglyph(pronunciation: "na", image: "hiragana-na"),
        Hieroglyph(pronunciation: "ne", image: "hiragana-ne"),
        Hieroglyph(pronunciation: "ni", image: "hiragana-ni"),
        Hieroglyph(pronunciation: "no", image: "hiragana-no"),
        Hieroglyph(pronunciation: "nu", image: "hiragana-nu"),
        Hieroglyph(pronunciation: "o", image: "hiragana-o"),
        Hieroglyph(pronunciation: "ra", image: "hiragana-ra"),
        Hieroglyph(pronunciation: "re", image: "hiragana-re"),
        Hieroglyph(pronunciation: "ri", image: "hiragana-ri"),
        Hieroglyph(pronunciation: "ro", image: "hiragana-ro"),
        Hieroglyph(pronunciation: "ru", image: "hiragana-ru"),
        Hieroglyph(pronunciation: "sa", image: "hiragana-sa"),
        Hieroglyph(pronunciation: "se", image: "hiragana-se"),
        Hieroglyph(pronunciation: "shi", image: "hiragana-shi"),
        Hieroglyph(pronunciation: "so", image: "hiragana-so"),
        Hieroglyph(pronunciation: "su", image: "hiragana-su"),
        Hieroglyph(pronunciation: "ta", image: "hiragana-ta"),
        Hieroglyph(pronunciation: "te", image: "hiragana-te"),
        Hieroglyph(pronunciation: "to", image: "hiragana-to"),
        Hieroglyph(pronunciation: "tsu", image: "hiragana-tsu"),
        Hieroglyph(pronunciation: "u", image: "hiragana-u"),
        Hieroglyph(pronunciation: "wa", image: "hiragana-wa"),
        Hieroglyph(pronunciation: "wo", image: "hiragana-wo"),
        Hieroglyph(pronunciation: "ya", image: "hiragana-ya"),
        Hieroglyph(pronunciation: "yo", image: "hiragana-yo"),
        Hieroglyph(pronunciation: "yu", image: "hiragana-yu")]
    
    func startTraining() {
        refreshContent()
    }
    
    func checkAnswer(index: Int) {
        if index == correctButtonIndex {
            refreshContent()
        }
        else {
            choosenCard = nil
        }
    }
    
    private func refreshContent() {
        if let randomType = QuestionType.allCases.randomElement() {
            questionType = randomType
        }
        buttonLabels = randomUniqueElements(array: words)
        correctButtonIndex = Int.random(in: 0..<4)
        currentWord = buttonLabels[correctButtonIndex]
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
