//
//  ReusableTextField.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 23.05.2024.
//

import SwiftUI
import Combine

struct DayStoryTextField: View {
    
    @Binding var text: String
    var title: String
    var placeholder: String
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    var errorMessage: String? = nil
    var textLimit: Int? = nil
    
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
                    .foregroundStyle(errorMessage == nil ? .dayStoryPurple : .red)
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
                    .foregroundColor(.red)
                    .padding([.leading, .top], 16)
            }
        }
    }
    
    @ViewBuilder
    private var textField: some View {
        TextField(placeholder, text: $text)
            .padding()
            .padding(.trailing, 30)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(errorMessage != nil ? Color.red : Color.textFieldBorder, lineWidth: 1)
            )
            .keyboardType(keyboardType)
            .textInputAutocapitalization(.never)
            .onReceive(Just(text)) { _ in limitText(textLimit) }
    }
    
    @ViewBuilder
    private var secureField: some View {
        SecureField(placeholder, text: $text)
            .padding()
            .padding(.trailing, 30)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(errorMessage != nil ? Color.red : Color.textFieldBorder, lineWidth: 1)
            )
            .onReceive(Just(text)) { _ in limitText(textLimit) }
    }
    
    func limitText(_ upper: Int?) {
        if let upper = upper, text.count > upper {
            text = String(text.prefix(upper))
        }
    }
}

#Preview {
    DayStoryTextField(text: .constant(""), title: "Test", placeholder: "Test Placeholder")
}
