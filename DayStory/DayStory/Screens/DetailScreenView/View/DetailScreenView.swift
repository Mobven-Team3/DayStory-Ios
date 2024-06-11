//
//  DetailScreenView.swift
//  DayStory
//
//  Created by Mobven on 31.05.2024.
//

import SwiftUI

struct DetailScreenView: View {

    @StateObject private var viewModel = DetailScreenViewModel()
    let summary: ImageModel?

    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Text(summary?.date?.replacingOccurrences(of: "-", with: "/") ?? "")
                        .font(.system(size: 16))
                        .padding()
                    
                    AsyncImage(url: URL(string: summary?.imagePath ?? "")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 335, height: 335)
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 335, height: 335)
                    }
                }
                .padding()
                
                Text("Notlar")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .padding(.bottom)
                
                VStack(spacing: 25) {
                    ForEach(viewModel.notes, id: \.id) { note in
                        NoteListingView(isEditing: false, note: note)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            DayStoryToolbar()
        }
        .onAppear {
            Task {
                await viewModel.getNotes(date: summary?.date ?? "")
            }
        }
    }
}
struct DetailScreenView_Previews : PreviewProvider {
    static var previews: some View {
        DetailScreenView(summary: ImageModel(id: 0, date: "", imagePath: ""))
    }
}

