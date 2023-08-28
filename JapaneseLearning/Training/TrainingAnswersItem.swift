//
//  TrainingAnswersItem.swift
//  JapaneseLearning
//
//  Created by Гаджи Герейакаев on 17.08.2023.
//

import SwiftUI

struct TrainingAnswersItem: View {
    
    
    public var questionType: QuestionType
    public var item: Hieroglyph
    var isSelected: Bool
    var index: Int
    @Binding var selectedButtonIndex: Int?
    
    var body: some View {
        Button(action: {
            if isSelected {
                selectedButtonIndex = nil
            } else {
                selectedButtonIndex = index
            }
            
        }) {
            VStack {
                if questionType == .pronunciation {
                    Image(item.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                } else {
                    Text(item.pronunciation)
                        .font(questionType == .pronunciation ? .title2 : .title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                }
            }
        }
        .frame(width: 100, height: 130)
        .background(isSelected ? Color.green : Color(red: 0.4627, green: 0.8392, blue: 1.0))
        .cornerRadius(10)
        .padding(5)
    }
}
struct TrainingAnswersItem_Previews: PreviewProvider {
    static var previews: some View {
        TrainingAnswersItem(questionType: .hieroglyph, item: Hieroglyph(pronunciation: "a", image: "hiragana-a"), isSelected: false, index: 0, selectedButtonIndex: .constant(0))
    }
}
