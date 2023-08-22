//
//  TrainingAnswersItem.swift
//  JapaneseLearning
//
//  Created by Гаджи Герейакаев on 17.08.2023.
//

import SwiftUI

struct TrainingAnswersItem: View {
    private var test = true
    var body: some View {
        Button {
            //
        } label: {
            VStack {
                if test {
                    Image("hiragana-a")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                }
                
                Text("a")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
            
        } .frame(width: 100, height: 130)
            .background(Color(red: 0.4627, green: 0.8392, blue: 1.0))
            .cornerRadius(10)
            .padding(5)
        
    }
}

struct TrainingAnswersItem_Previews: PreviewProvider {
    static var previews: some View {
        TrainingAnswersItem()
    }
}
