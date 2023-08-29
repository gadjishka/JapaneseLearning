//
//  Traning_View.swift
//  JapaneseLearning
//
//  Created by Гаджи Герейакаев on 17.08.2023.
//

import SwiftUI

struct MainMenu: View {
    @State private var continueButtonDisabled: Bool = true
    @ObservedObject private var viewModel = TrainingViewModel.shared
    @ObservedObject private var dictionaryManager = DictionaryHiragana.shared
    @State private var showAlert: Bool = false
    @State private var startTraining: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.23, green: 0.64, blue: 0.82).edgesIgnoringSafeArea(.top)
                VStack {
                    Button {
                        if dictionaryManager.currentDictionary.learnedHieroglyphs.count == 0 {
                            showAlert = true
                            startTraining = false
                        }
                        else {
                            showAlert = false
                            startTraining = true
                        }
                        
                        
                    } label: {
                        Text("Начать")
                            .foregroundColor(.white)
                    }
                    .frame(width: 140, height: 50)
                    .background(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                    .background(NavigationLink("", destination: Training_View(), isActive: $startTraining))
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                    
                    
                    NavigationLink {
                        Training_View()
                    } label: {
                        Text("Продолжить")
                            .foregroundColor(.white)
                            .opacity(continueButtonDisabled ? 0.3 : 1.0)
                    }
                    .frame(width: 140, height: 50)
                    .background(continueButtonDisabled ?  Color.gray : Color(red: 0.4627, green: 0.8392, blue: 1.0))
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                    .disabled(continueButtonDisabled)
                    
                    NavigationLink {
                        Training_View()
                    } label: {
                        Text("Рекорды")
                            .foregroundColor(.white)
                    } .frame(width: 140, height: 50)
                        .background(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                    
                    
                }
                if showAlert {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showAlert = false
                        }
                    
                    VStack {
                        Spacer()
                        
                        CustomAlertView(isPresented: $showAlert, mainText: "Ты не можешь начать, ты еще не изучил ни одного иероглифа", buttonText: "Изучи и возвращайся")
                        
                        Spacer()
                    }
                }
            }
            
        }
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
