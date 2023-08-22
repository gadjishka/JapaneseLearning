//
//  TrainingAnswersRow.swift
//  JapaneseLearning
//
//  Created by Гаджи Герейакаев on 17.08.2023.
//

import SwiftUI

struct TrainingAnswersRow: View {
    var body: some View {
        VStack {
            HStack {
                TrainingAnswersItem()
                Spacer()
                TrainingAnswersItem()
            } .frame(width: 250)
            HStack {
                TrainingAnswersItem()
                Spacer()
                TrainingAnswersItem()
            } .frame(width: 250)
        }
    }
}

struct TrainingAnswersRow_Previews: PreviewProvider {
    static var previews: some View {
        TrainingAnswersRow()
    }
}
