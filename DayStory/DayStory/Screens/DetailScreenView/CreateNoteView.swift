//
//  CreateNoteView.swift
//  DayStory
//
//  Created by Mobven on 2.06.2024.
//

import SwiftUI

struct CreateNoteView: View {
    @State var text: String = ""
    @State var notes: String = ""
    var body: some View {
        NavigationStack {
            GeometryReader { reader in
                ScrollView {
                    VStack{
                        AuthenticationHelperText(text: "Notunuzu yazınız.")
                        Form {
                            Section {
                                DayStoryTextField(text: $text, title: "Başlık", placeholder: "Not başlığınızı giriniz.")
                                Text("*En fazla 250 karakter")
                                    .foregroundStyle(.buttonPurple)
                                    .font(.system(size: 12, weight: .semibold))
                                    .padding([.leading, .bottom])
                            }
//                    .padding(.vertical)
                            Section {
                                DayStoryNoteTextField(text: $notes, title: "Notunuz", placeholder: "Notunuzun detaylarını giriniz.")
                                Text("*En fazla 350 karakter")
                                    .foregroundStyle(.buttonPurple)
                                    .font(.system(size: 12, weight: .semibold))
                                    .padding(.leading)
                                
                            }

                        }
                        .formStyle(.columns)
                        
                  
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: DetailScreenView()) {}
                        Button(action: {
                            
                        }) {
                            Text("Kaydet")                                         .font(Font.system(size: 15))
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(width: 90, height: 46)
                                .frame(maxWidth: .infinity)
                                .background(Color.dayStoryPurple)
                                .clipShape(.capsule)
                        }
                        .padding(.trailing, -45)
                        .padding(.leading, 180)
                        NavigationLink(destination: DetailScreenView()) {
                            Text("İptal")
                                .foregroundStyle(.buttonPurple)
                                .font(.system(size: 15, weight: .semibold))
                                .frame(width: 90,height: 46)
                                .frame(maxWidth: .infinity)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.textFieldBorder))
                                .padding(.trailing, 1)
                                .padding(.leading, 50)
                        }
                    }
                    . padding(.trailing)
                    
                    //                .padding(.bottom)
                    
                }
                    .frame(minHeight: reader.size.height)
                }
            }
        }
    }
}
#Preview {
    CreateNoteView()
}
