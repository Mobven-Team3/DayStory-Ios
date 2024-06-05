//
//  testDetailView.swift
//  DayStory
//
//  Created by Mobven on 31.05.2024.
//

import SwiftUI

struct testDetailView: View {
    @State private var texts = ["Metin 1", "Metin 2", "Metin 3"]
    var body: some View {
        NavigationStack {
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
                .padding(.top, -380)
                
                // Navigasyon bağlantısı buraya taşındı
                NavigationLink("", destination: SignupPersonalView())
                
                // Tarih bilgisi buraya taşındı
                Text("gg.aa.yy")
                    .frame(width: 80, height: 24)
                    .padding(.top, -320)
                
                // Image görünümü burada gösteriliyor
                Image("daystoryOnboarding")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 409, height: 409)
                    .padding(.top, 200)
            }
            VStack {
                List {
                    ForEach(0..<texts.count, id: \.self) { index in
                        TextField("Metni düzenle", text: self.$texts[index])
                            .padding()
                            .border(Color.gray, width: 1)
                            .padding(.horizontal)
                    }
                }
                
            }
            
        }
        
    }
    
    static var previews: some View {
        testDetailView()
    }
}
