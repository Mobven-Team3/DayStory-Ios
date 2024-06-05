//
//  GalleryCardView.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 1.06.2024.
//

import SwiftUI

struct GalleryCardView: View {
    
    var isPlaceHolder = false
    
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
            
            if isPlaceHolder {
                placeHolderView
            } else {
                imageView
            }
        }
        .padding(3)
        .overlay {
            RoundedRectangle(cornerRadius: 4)
                .stroke(lineWidth: 1)
                .foregroundStyle(.cardBorder)
        }
    }
}

// MARK: - Views
private extension GalleryCardView {
    var placeHolderView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.galleryPlaceholderGray)
                .frame(width: 100, height: 100)
            
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundStyle(.dayStoryPurple)
        }
    }
    
    var imageView: some View {
        Image("card")
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
    }
}

#Preview {
    GalleryCardView()
}
