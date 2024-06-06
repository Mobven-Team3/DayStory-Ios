//
//  CreateNoteView.swift
//  DayStory
//
//  Created by Mobven on 2.06.2024.
//

import SwiftUI

struct CreateNoteView: View {
    
    @StateObject private var viewModel = CreateNoteViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack{
                    AuthenticationHelperText(text: "Notunuzu yazınız.")
                    
                    Form {
                        DayStoryTextField(text: $viewModel.title,
                                          title: "Başlık",
                                          placeholder: "Not başlığınızı giriniz.",
                                          errorMessage: viewModel.titleErrorMessage,
                                          textLimit: 250)
                        
                        Text("*En fazla 250 karakter")
                            .foregroundStyle(.todayScreenText)
                            .font(.system(size: 12))
                            .padding([.leading, .bottom])
                        
                        DayStoryTextField(text: $viewModel.note,
                                          title: "Notunuz",
                                          placeholder: "Notunuzun detaylarını giriniz.",
                                          textLimit: 350,
                                          isLarge: true)
                        
                        Text("*En fazla 350 karakter")
                            .foregroundStyle(.todayScreenText)
                            .font(.system(size: 12))
                            .padding(.leading)
                    }
                    .formStyle(.columns)
                }
            }
            HStack {
                Spacer()
                
                HStack() {
                    Button {
                        viewModel.validateFields()
                    } label: {
                        Text("Kaydet")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(width: 92, height: 40)
                            .background(.dayStoryPurple)
                            .clipShape(.capsule)
                    }
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("İptal")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.dayStoryPurple)
                            .frame(width: 92, height: 40)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .overlay(
                                Capsule()
                                    .stroke(.textFieldBorder, lineWidth: 1)
                            )
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

#Preview {
    CreateNoteView()
}
