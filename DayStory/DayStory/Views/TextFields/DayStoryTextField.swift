//
//  ReusableTextField.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 23.05.2024.
//

import SwiftUI

struct DayStoryTextField: View {
    
    @Binding var text: String
    var placeholder: String
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default

    var body: some View {
        ZStack(alignment: .trailing) {
            if isSecure {
                secureField
            } else {
                textField
            }

            Button {
                text = ""
            } label: {
                Image(systemName: "x.circle")
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
                    .foregroundColor(.dayStoryPurple)
            }
        }
        .padding()
    }
    
    @ViewBuilder
    private var textField: some View {
        TextField(placeholder, text: $text)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.textFieldBorder, lineWidth: 1)
            )
            .keyboardType(keyboardType)
            .textInputAutocapitalization(.never)
    }

    @ViewBuilder
    private var secureField: some View {
        SecureField(placeholder, text: $text)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.textFieldBorder, lineWidth: 1)
            )
    }
}

#Preview {
    DayStoryTextField(text: .constant(""), placeholder: "Test Placeholder")
}
