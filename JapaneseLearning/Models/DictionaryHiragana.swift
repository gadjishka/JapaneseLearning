//
//  DataModel.swift
//  JapaneseLearning
//
//  Created by Гаджи Герейакаев on 21.08.2023.
//

import Foundation

enum KeysUserDefaults{
    static let training = "training"
}

struct Training: Codable, Equatable{
    var learnedHieroglyphs: [Hieroglyph]
    var notLearnedHieroglyphs: [Hieroglyph]
}

class DictionaryHiragana: ObservableObject {
    static var shared = DictionaryHiragana()
    
    private let defaultDictionary = Training(learnedHieroglyphs: [],
                                             notLearnedHieroglyphs: [
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
                                                Hieroglyph(pronunciation: "yu", image: "hiragana-yu")])
    
    @Published var currentDictionary: Training{
        didSet{
            if let data = try? PropertyListEncoder().encode(currentDictionary){
                UserDefaults.standard.setValue(data, forKey: KeysUserDefaults.training)
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.object(forKey: KeysUserDefaults.training) as? Data {
            currentDictionary = (try? PropertyListDecoder().decode(Training.self, from: data)) ?? defaultDictionary
        } else {
            currentDictionary = defaultDictionary
            if let data = try? PropertyListEncoder().encode(defaultDictionary) {
                UserDefaults.standard.setValue(data, forKey: KeysUserDefaults.training)
            }
        }
        TrainingViewModel.shared.allWords = currentDictionary.notLearnedHieroglyphs + currentDictionary.learnedHieroglyphs
        TrainingViewModel.shared.learnedWords = currentDictionary.learnedHieroglyphs

    }
    
    private func saveDictToDefaults() {
        if let data = try? PropertyListEncoder().encode(currentDictionary) {
            UserDefaults.standard.setValue(data, forKey: KeysUserDefaults.training)
        }
    }
    
    func resetSettings(){
        currentDictionary = defaultDictionary
    }
    
    func addHierogliph(hieroglyph: Hieroglyph) {
        if let index = currentDictionary.notLearnedHieroglyphs.firstIndex(where: {$0.pronunciation == hieroglyph.pronunciation}) {
            currentDictionary.notLearnedHieroglyphs.remove(at: index)
        }
        var newHieroglyph = hieroglyph
        newHieroglyph.learnHieroglyph()
        currentDictionary.learnedHieroglyphs.append(newHieroglyph)
        saveDictToDefaults()
    }
    
}
