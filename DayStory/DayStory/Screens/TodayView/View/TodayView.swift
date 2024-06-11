//
//  TodayView.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 31.05.2024.
//

import SwiftUI

struct TodayView: View {
    
    @StateObject private var viewModel = TodayViewModel()
    @State private var showAlert = false
    let date = Date()
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Text(date.toString(format: "dd.MM.yyyy"))
                        .font(.callout)
                        .padding(.vertical, 35)
                    
                    VStack {
                        Button {
                            self.showAlert.toggle()
                        } label: {
                            GradientButton(title: "AI Gün Özeti Oluştur")
                        }
                        .disabled(viewModel.notes.count == 0)
                        .opacity(viewModel.notes.count == 0 ? 0.5 : 1)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Günde yalnızca 1 kez AI gün özetinizi oluşturabilirsiniz.\nDevam etmek istiyor musunuz?"),
                            primaryButton: .destructive(Text("Vazgeç")),
                            secondaryButton: .cancel(Text("Devam Et")) {
                                Task {
                                    await viewModel.createSummary(date: CreateDaySummaryContract(date: date.toString()))
                                }
                            }
                        )
                    }

                    NavigationLink(destination: DetailScreenView(summary: viewModel.summary),
                                   isActive: $viewModel.isImageCreateSuccessful) {}

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
                                NoteListingView(viewModel: viewModel, note: note)
                            }
                        }
                    }
                    
                    Spacer(minLength: 80)
                }
            }
            .blur(radius: viewModel.isLoading ? 10 : 0)
            
            if viewModel.isLoading {
                DayStoryLoadingView()
            }
        }
        .overlay(alignment: .bottomTrailing) {
            if !viewModel.isLoading {
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

#Preview {
    TodayView()
}
