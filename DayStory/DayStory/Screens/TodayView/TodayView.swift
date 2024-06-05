//
//  TodayView.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 31.05.2024.
//

import SwiftUI

struct TodayView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("gg.aa.yyyy")
                        .font(.callout)
                        .padding(.vertical, 35)
                    
                    GradientButton(title: "AI Gün Özeti Oluştur")
                        .opacity(0.5)
                    
                    Text("Notlar")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .padding(.top, 45)
                    
                    Text("Bu gün için notunuz bulunmuyor.")
                        .font(.callout)
                        .foregroundStyle(.todayScreenText)
                        .padding()
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
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                DayStoryToolbar()
            }
        }
    }
}

#Preview {
    TodayView()
}
