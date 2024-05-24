//
//  SignupSectionView.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 24.05.2024.
//

import SwiftUI

struct SignupSectionView: View {
    var body: some View {
        HStack {
            Rectangle()
                .frame(height: 4)
                .foregroundColor(.dayStoryPurple.opacity(0.5))
                .clipShape(.capsule)
            
            Spacer()
            
            Rectangle()
                .frame(height: 4)
                .foregroundColor(.dayStoryPurple)
                .clipShape(.capsule)
        }
        .padding()
    }
}

#Preview {
    SignupSectionView()
}
