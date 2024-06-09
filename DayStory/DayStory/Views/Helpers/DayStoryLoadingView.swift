//
//  DayStoryLoadingView.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 9.06.2024.
//

import SwiftUI

struct DayStoryLoadingView: View {
    
    @State private var rotationAngle: Double = 0
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.7)
                .edgesIgnoringSafeArea(.all)
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .rotationEffect(.degrees(rotationAngle))
                .onAppear {
                    withAnimation(Animation.linear(duration: 3).repeatForever(autoreverses: false)) {
                        self.rotationAngle = 360
                    }
                }
        }
    }
}

#Preview {
    DayStoryLoadingView()
}
