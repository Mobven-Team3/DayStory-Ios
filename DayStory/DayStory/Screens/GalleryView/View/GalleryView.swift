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
    
    var itemCount = 0
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if itemCount == 0 {
                    VStack {
                        Text("Mayıs 2024")
                            .font(.title3)
                            .padding()
                        
                        NavigationLink(destination: DetailScreenView()) {
                            GalleryCardView(isPlaceHolder: true)
                                .padding()
                        }
                        
                        Image("loginImage")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 144, height: 144)
                        
                        Text("İlk günün için notlarını al \nve kişisel hikayeni oluşturmaya \nbaşla!")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .lineLimit(3)
                            .offset(y: -20)
                    }
                    .padding()
                } else {
                    VStack(alignment: .leading) {
                        Text("Mayıs 2024")
                            .font(.title3)
                        
                        LazyVGrid(columns: columns) {
                            ForEach(0..<self.itemCount) {_ in
                                NavigationLink(destination: DetailScreenView()) {
                                    GalleryCardView()
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                DayStoryToolbar()
            }
        }
    }
}

#Preview {
    GalleryView()
}
