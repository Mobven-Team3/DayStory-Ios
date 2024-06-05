//
//  DetailScreenView.swift
//  DayStory
//
//  Created by Mobven on 31.05.2024.
//

import SwiftUI

struct DetailScreenView: View {
    @State private var subText = ["Title1","Title2","Title3"]
    @State private var texts = ["Metin 1", "Metin 2", "Metin 3", "Metin 3", "Metin 3", "Metin 3"]
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack(spacing: 0) {
                        Text("Day")
                            .font(.largeTitle)
                            .fontWeight(.medium)
                            .foregroundStyle(.dayStoryPurple)
                        Text("Story")
                            .font(.largeTitle)
                            .fontWeight(.thin)
                            .foregroundStyle(.dayStoryPurple)
                    }
                    
                    //                destination değişecek
                    NavigationLink("", destination: SignupPersonalView())
                    //                text içine seçilen tarih çekilecek
                    VStack {
                        Text("gg.aa.yy")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                        Image("daystoryOnboarding")
                            .resizable()
                            .frame(width: 409, height: 300)
                    } .padding()
                    Text("Notlar")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    VStack {
                            ForEach(texts.indices, id: \.self) { index in
                                TextField("Test", text: self.$texts[index])
                                    .frame(height: 128, alignment: .topLeading)
                                    .padding(.leading, 5)
                                    .padding(.top, 5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(.textFieldBorder, lineWidth: 0.5)
                                            .shadow(color: .textFieldShadow, radius: 0.05, x: 0, y: 0.5)
                                    )
                            }
                        
//                        .frame(minHeight: minRowHeight * 5)
                    } .padding(.horizontal, 45)
                }
            }
        }
        }
    
    }
struct DetailScreenView_Previews : PreviewProvider {
    static var previews: some View {
        DetailScreenView()
    }
}

