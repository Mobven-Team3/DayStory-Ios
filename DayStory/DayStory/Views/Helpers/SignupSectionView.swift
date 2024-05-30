//
//  SignupSectionView.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 24.05.2024.
//

import SwiftUI

struct SignupSectionView: View {
    
    var firstScreen: Bool
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(height: 4)
                .foregroundStyle(firstScreen ? .dayStoryPurple : .dayStoryPurple.opacity(0.5))
                .clipShape(.capsule)
            
            Rectangle()
                .frame(height: 4)
                .foregroundStyle(firstScreen ? .dayStoryPurple.opacity(0.5) : .dayStoryPurple)
                .clipShape(.capsule)
        }
        .padding()
    }
}

#Preview {
    SignupSectionView(firstScreen: true)
}
