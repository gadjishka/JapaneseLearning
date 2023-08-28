//
//  TrainingAnswersRow.swift
//  JapaneseLearning
//
//  Created by Гаджи Герейакаев on 17.08.2023.
//

import SwiftUI

struct TrainingAnswersRow: View {
    @ObservedObject private var viewModel = TrainingViewModel.shared
    var buttonLabels: [Hieroglyph]
    var correctButtonIndex: Int
    var questionType: QuestionType
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<2) { index in
                    TrainingAnswersItem(
                        questionType: questionType,
                        item: buttonLabels.count != 0 ? buttonLabels[index] : Hieroglyph(pronunciation: "a", image: "search"),
                        isSelected: viewModel.choosenCard == index, index: index, selectedButtonIndex: $viewModel.choosenCard)
                    
                    Spacer()
                }
            }
            .frame(width: 250)
            
            HStack {
                ForEach(2..<4) { index in
                    TrainingAnswersItem(
                        questionType: questionType,
                        item: buttonLabels.count != 0 ? buttonLabels[index] : Hieroglyph(pronunciation: "a", image: "search"),
                        isSelected: viewModel.choosenCard == index, index: index, selectedButtonIndex: $viewModel.choosenCard)
                    Spacer()
                }
            }
            .frame(width: 250)
        }
    }
}

struct TrainingAnswersRow_Previews: PreviewProvider {
    static var previews: some View {
        TrainingAnswersRow(buttonLabels: [
            Hieroglyph(pronunciation: "a", image: "hiragana-a"),
            Hieroglyph(pronunciation: "chi", image: "hiragana-chi"),
            Hieroglyph(pronunciation: "e", image: "hiragana-e"),
            Hieroglyph(pronunciation: "fu", image: "hiragana-fu"),
            Hieroglyph(pronunciation: "ha", image: "hiragana-ha"),
            Hieroglyph(pronunciation: "he", image: "hiragana-he"),
            Hieroglyph(pronunciation: "hi", image: "hiragana-hi"),
            Hieroglyph(pronunciation: "ko", image: "hiragana-ho"),
            Hieroglyph(pronunciation: "i", image: "hiragana-i")]
                           , correctButtonIndex: 0, questionType: .hieroglyph)
    }
}
