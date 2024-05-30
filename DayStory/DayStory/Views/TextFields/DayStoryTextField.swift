//
//  ReusableTextField.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 23.05.2024.
//

import SwiftUI

struct DayStoryTextField: View {
    
    @Binding var text: String
    var title: String
    var placeholder: String
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    var errorMessage: String? = nil
    
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
                    .foregroundStyle(.dayStoryPurple)
            }
        }
        .padding()
        .overlay(alignment: .topLeading) {
            Text(title)
                .font(.subheadline)
                .offset(x: 17, y: -5)
        }
        .overlay(alignment: .bottomLeading) {
            if let errorMessage = errorMessage, !errorMessage.isEmpty {
                Text(errorMessage)
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(.dayStoryPurple)
                    .padding([.leading, .top], 16)
            }
        }
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
    DayStoryTextField(text: .constant(""), title: "Test", placeholder: "Test Placeholder")
}
