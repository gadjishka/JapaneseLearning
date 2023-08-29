//
//  CustomAlertView.swift
//  JapaneseLearning
//
//  Created by Гаджи Герейакаев on 28.08.2023.
//

import SwiftUI

struct CustomAlertView: View {
    @Binding var isPresented: Bool
    var mainText: String
    var buttonText: String
    
    var body: some View {
        VStack(spacing: 60) {
            Text(mainText)
                .font(.title)
                .foregroundColor(.red)
            
            Button {
                isPresented = false
            } label: {
                Text(buttonText)
                    .font(.system(size: 17))
                    .foregroundColor(.white)
            }
            
            .padding()
            .background(Color(red: 0.4627, green: 0.8392, blue: 1.0))
            .cornerRadius(10)
            
        }
        .frame(width: 250, height: 250) // Set the desired size
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}
struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView(isPresented: .constant(true), mainText: "Неправильно", buttonText: "Попробуй снова😑")
    }
}
