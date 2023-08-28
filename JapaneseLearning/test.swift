//
//  test.swift
//  JapaneseLearning
//
//  Created by Гаджи Герейакаев on 22.08.2023.
//

import SwiftUI

struct test: View {
    let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7", "Item 8", "Item 9", "Item 10"]
        @State private var randomIndex = Int.random(in: 0..<10)
        @State private var buttonTexts = [String]()
        @State private var correctButtonIndex = Int.random(in: 0..<4)
        @State private var showAlert = false
        @State private var buttonColor: Color? = nil

        func setupButtons() {
            buttonTexts = (0..<4).map { index in
                if index == correctButtonIndex {
                    return items[randomIndex]
                } else {
                    var randomButtonIndex = Int.random(in: 0..<10)
                    while randomButtonIndex == randomIndex {
                        randomButtonIndex = Int.random(in: 0..<10)
                    }
                    return items[randomButtonIndex]
                }
            }
        }

        var body: some View {
            VStack {
                Text(items[randomIndex])
                    .font(.headline)
                    .padding()

                ForEach(0..<4) { index in
                    Button(action: {
                        if index == correctButtonIndex {
                            self.randomIndex = Int.random(in: 0..<10)
                            self.correctButtonIndex = Int.random(in: 0..<4)
                            self.setupButtons()
                        } else {
                            self.buttonColor = .red
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                self.buttonColor = nil
                            }
                        }
                    }) {
                        Text(buttonTexts[index])
                            .font(.subheadline)
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                    }
                    .disabled(buttonColor != nil)
                }
            }
            .onAppear {
                self.setupButtons()
            }
        }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
