//
//  GalleryView.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 31.05.2024.
//

import SwiftUI

struct GalleryView: View {
    
    @StateObject private var viewModel = GalleryViewModel()
    @Binding var selectedTab: Int
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    let date = Date()
    
    var body: some View {
        ScrollView {
            if viewModel.summaries?.count == 0 {
                VStack {
                    Text(date.formattedString(format: "MMMM yyyy"))
                        .font(.title3)
                        .padding()
                    
                    Button {
                        selectedTab = 1
                    } label: {
                        GalleryCardView(summary: nil, isPlaceHolder: true)
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
                    Text("Haziran 2024")
                        .font(.title3)
                    
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.summaries ?? [], id: \.id) { summary in
                            NavigationLink(destination: DetailScreenView(summary: summary)) {
                                GalleryCardView(summary: summary)
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
        .onAppear {
            Task {
                await viewModel.getAllSummaries()
            }
        }
    }
}

#Preview {
    GalleryView(selectedTab: .constant(0))
}
