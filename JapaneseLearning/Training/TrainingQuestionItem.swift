//
//  TrainingQuestionItem.swift
//  JapaneseLearning
//
//  Created by Гаджи Герейакаев on 17.08.2023.
//

import SwiftUI

struct TrainingQuestionItem: View {
    public var item: Hieroglyph
    public var questionType: QuestionType
    var body: some View {
        VStack(spacing: 30) {
            Text(questionType == .pronunciation ? (questionType.rawValue) : questionType.rawValue)
                .font(.largeTitle)
            switch questionType {
            case .hieroglyph: Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipped()
                    .padding(EdgeInsets(top: 13, leading: 16, bottom: 0, trailing: 13))
                    .background(Color(red: 0.03, green: 0.45, blue: 0.63))
                    .cornerRadius(10)
                    .shadow(radius: 5)
            case .pronunciation:
                Text(item.pronunciation)
                    .font(.system(size: 50))
                    .bold()
            }

            
        }
    }
}

struct TrainingQuestionItem_Previews: PreviewProvider {
    static var previews: some View {
        TrainingQuestionItem(item: Hieroglyph(pronunciation: "a", image: "hiragana-a"), questionType: .hieroglyph)
    }
}
