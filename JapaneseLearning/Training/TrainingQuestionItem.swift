//
//  TrainingQuestionItem.swift
//  JapaneseLearning
//
//  Created by Гаджи Герейакаев on 17.08.2023.
//

import SwiftUI

struct TrainingQuestionItem: View {
    var body: some View {
        VStack {
            Text("Как читается данный иероглиф?")
                .font(.largeTitle)
            Image("hiragana-a")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .clipped()
                .padding(EdgeInsets(top: 13, leading: 16, bottom: 0, trailing: 13))
                .background(Color(red: 0.03, green: 0.45, blue: 0.63))
                .cornerRadius(10)
                .shadow(radius: 5)
        }
    }
}

struct TrainingQuestionItem_Previews: PreviewProvider {
    static var previews: some View {
        TrainingQuestionItem()
    }
}
