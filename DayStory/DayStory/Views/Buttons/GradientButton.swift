//
//  GradientButton.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 23.05.2024.
//

import SwiftUI

struct GradientButton: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(Font.system(size: 15))
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(height: 46)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(LinearGradient.actionButton)
            .clipShape(.capsule)
            .padding()
    }
}

#Preview {
    GradientButton(title: "Test Title")
}
