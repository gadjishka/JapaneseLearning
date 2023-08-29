//
//  test.swift
//  JapaneseLearning
//
//  Created by Гаджи Герейакаев on 22.08.2023.
//

import SwiftUI

struct test: View {
    @State private var valueToUpdate = 0
    @State private var isSecondScreenActive = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Значение: \(valueToUpdate)")
                    .font(.title)
                Button("Увеличить значение и перейти") {
                    valueToUpdate += 1
                    isSecondScreenActive = true
                }
                .background(NavigationLink("", destination: SecondView(value: valueToUpdate), isActive: $isSecondScreenActive))
                .padding()
            }
        }
    }
}

struct SecondView: View {
    var value: Int
    
    var body: some View {
        VStack {
            Text("Второй экран")
                .font(.title)
            Text("Полученное значение: \(value)")
        }
        .navigationBarTitle("Второй экран", displayMode: .inline)
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
