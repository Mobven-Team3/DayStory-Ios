//
//  GalleryCardView.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 1.06.2024.
//

import SwiftUI

struct GalleryCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text("6")
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    Text("Pazartesi")
                        .font(.system(size: 10))
                    
                    Text("Mayıs")
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                }
            }
            
            Image("card")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
        }
        .padding(.all, 3)
        .overlay {
            RoundedRectangle(cornerRadius: 4)
                .stroke(lineWidth: 1)
                .foregroundStyle(.cardBorder)
        }
    }
}

#Preview {
    GalleryCardView()
}
