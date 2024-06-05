//
//  DayStoryNoteTextField.swift
//  DayStory
//
//  Created by Mobven on 4.06.2024.
//

import SwiftUI

struct DayStoryNoteTextField: View {
    @Binding var text: String
    var title: String
    var placeholder: String
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    var errorMessage: String? = nil
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
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
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.dayStoryPurple)
            }
        }
        .overlay(alignment: .topLeading) {
            Text(title)
                .font(.subheadline)
                .offset(x: 17, y: -20)
        }
        .overlay(alignment: .bottomLeading) {
            if let errorMessage = errorMessage, !errorMessage.isEmpty {
                Text(errorMessage)
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(.dayStoryPurple)
                    .padding([.leading, .top], 16)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.textFieldBorder, lineWidth: 1)
                .frame(height: 200)
        )
        .padding()
    }
    @ViewBuilder
    private var textField: some View {
        TextField(placeholder, text: $text, axis: .vertical)
            .padding()

            .frame(height: 200, alignment: .topLeading)
            .keyboardType(keyboardType)
            .textInputAutocapitalization(.never)
            .lineLimit(5...10)
    }
    
    @ViewBuilder
    private var secureField: some View {
        SecureField(placeholder, text: $text)
//            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.textFieldBorder, lineWidth: 1)
                    .frame(height: 200)
            )
    }
}

#Preview {
    DayStoryNoteTextField(text: .constant(""), title: "Test", placeholder: "Test Placeholder")
}
