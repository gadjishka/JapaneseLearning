//
//  Training_View.swift
//  JapaneseLearning
//
//  Created by Гаджи Герейакаев on 17.08.2023.
//

import SwiftUI

struct Training_View: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var viewModel = TrainingViewModel.shared
    @State private var tabBarBool: Bool = true
    
    var body: some View {
        ZStack {
            Color(red: 0.23, green: 0.64, blue: 0.82).edgesIgnoringSafeArea(.all)
            VStack {
                TrainingQuestionItem(item: viewModel.currentWord, questionType: viewModel.questionType)
                Spacer()
                TrainingAnswersRow(
                    buttonLabels: viewModel.buttonLabels,
                    correctButtonIndex: viewModel.correctButtonIndex, questionType: viewModel.questionType)
                Button(action: {
                    viewModel.checkAnswer(index: viewModel.choosenCard ?? -1)
                }) {
                    Text("Продолжить")
                        .font(.title3)
                        .foregroundColor(.white)
                }
                .frame(width: 300, height: 50)
                .background(viewModel.choosenCard != nil ? Color.green : Color.gray)
                .cornerRadius(10)
                .padding()
                .disabled(viewModel.choosenCard == nil)
            }
            .toolbar(tabBarBool ? .hidden : .visible, for: .tabBar)
            .navigationBarBackButtonHidden(tabBarBool)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "x.circle.fill")
                            .font(.title2)
                            .foregroundColor(.black)
                            .opacity(0.6)
                    }
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                }
            }
        }
        .onAppear {
            self.tabBarBool = true
            viewModel.startTraining()
        }
        .onDisappear {
            self.tabBarBool = false
        }
    }
}

struct Training_View_Previews: PreviewProvider {
    static var previews: some View {
        Training_View()
    }
}
