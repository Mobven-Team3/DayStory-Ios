//
//  LoginPrompt.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 24.05.2024.
//

import SwiftUI

struct LoginPrompt<Destination: View>: View {
    
    let promptText: String
    let linkText: String
    let linkDestination: Destination
    
    var body: some View {
        HStack {
            Text(promptText)
                .foregroundStyle(.dayStoryPurple)
                .font(.system(size: 14))
                .fontWeight(.semibold)
            
            NavigationLink(destination: linkDestination) {
                Text(linkText)
                    .font(Font.system(size: 14))
                    .fontWeight(.bold)
                    .foregroundStyle(.dayStoryPurple)
                    .underline(true)
            }
        }
        .padding(.horizontal)
        .padding(.top, 5)
    }
}
