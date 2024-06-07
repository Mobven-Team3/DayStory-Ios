//
//  TodayView.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 31.05.2024.
//

import SwiftUI

struct TodayView: View {
    
    @StateObject private var viewModel = TodayViewModel()
    let date = Date()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text(date.toString(format: "dd.MM.yyyy"))
                        .font(.callout)
                        .padding(.vertical, 35)
                    
                    Button {
                        
                    } label: {
                        GradientButton(title: "AI Gün Özeti Oluştur")
                    }
                    .disabled(viewModel.notes.count == 0)
                    .opacity(viewModel.notes.count == 0 ? 0.5 : 1)
                    
                    Text("Notlar")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .padding(.top, 45)
                        .padding(.bottom, 20)
                    
                    if viewModel.notes.count == 0 {
                        Text("Bu gün için notunuz bulunmuyor.")
                            .font(.callout)
                            .foregroundStyle(.todayScreenText)
                            .padding()
                    } else {
                        VStack(spacing: 25) {
                            ForEach(viewModel.notes, id: \.id) { note in
                                NoteListingView(note: note)
                            }
                        }
                    }
                    
                    Spacer(minLength: 80)
                }
            }
            .overlay(alignment: .bottomTrailing) {
                Button {
                    
                } label: {
                    NavigationLink(destination: CreateNoteView()) {
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                            .frame(width: 56, height: 56)
                            .background(.todayScreenText)
                            .clipShape(.buttonBorder)
                            .padding()
                    }
                }
            }
            .onAppear {
                Task {
                    await viewModel.getNotes(date: date.toString())
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(date.toString(format: "dd.MM.yyyy"))
            .toolbar {
                DayStoryToolbar()
            }
        }
    }
}

#Preview {
    TodayView()
}
