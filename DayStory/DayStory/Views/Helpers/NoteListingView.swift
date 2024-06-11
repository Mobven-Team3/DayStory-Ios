//
//  NoteListingView.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 5.06.2024.
//

import SwiftUI

struct NoteListingView: View {
    
    @ObservedObject var viewModel = TodayViewModel()
    @State var showAlert: Bool = false
    var isEditing = true
    var note: Events
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topTrailing) {
                VStack(alignment: .leading) {
                    Text(note.title ?? "")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundStyle(.noteTitle)
                        .padding(.bottom, 4)
                    
                    Text(note.description ?? "")
                        .font(.system(size: 14))
                        .foregroundStyle(.noteTitle)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 1)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.textFieldBorder).opacity(0.1))
                .padding([.leading, .trailing], 20)
                
                if isEditing {
                    Menu {
                        NavigationLink(destination: CreateNoteView(event: note)) {
                            Text("Düzenle")
                        }
                        
                        Button {
                            showAlert = true
                        } label: {
                            Text("Sil")
                        }
                    } label: {
                        Image(systemName: "ellipsis")
                            .imageScale(.medium)
                            .frame(width: 44, height: 44)
                            .foregroundStyle(.todayScreenText)
                            .rotationEffect(.degrees(90))
                            .padding(.trailing, 10)
                    }
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Bu notu silmek istediğinize emin misiniz?"),
                    primaryButton: .destructive(Text("Evet")) {
                        Task {
                            await viewModel.deleteEvent(id: note.id)
                        }
                    },
                    secondaryButton: .cancel(Text("Hayır"))
                )
            }
        }
    }
}

#Preview {
    NoteListingView(viewModel: TodayViewModel(), note: Events(id: 1, title: "Test title", description: "Test description", date: "", time: "", priority: ""))
}
