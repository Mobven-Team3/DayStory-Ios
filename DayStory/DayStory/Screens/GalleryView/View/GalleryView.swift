//
//  GalleryView.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 31.05.2024.
//

import SwiftUI

struct GalleryView: View {
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
        
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Mayıs 2024")
                        .font(.title3)
                    
                    LazyVGrid(columns: columns) {
                        GalleryCardView()
                        GalleryCardView()
                        GalleryCardView()
                        GalleryCardView()
                        GalleryCardView()
                        GalleryCardView()
                        GalleryCardView()
                        GalleryCardView()
                    }
                }
                .padding()
            }
            .toolbar {
                DayStoryToolbar()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    GalleryView()
}
