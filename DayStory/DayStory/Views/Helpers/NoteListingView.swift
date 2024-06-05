//
//  NoteListingView.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 5.06.2024.
//

import SwiftUI

struct NoteListingView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Başlık")
                .font(.system(size: 14))
                .fontWeight(.semibold)
                .foregroundStyle(.noteTitle)
                .padding(.bottom, 4)
            
            Text("Supporting line text lorem ipsum dolor sit amet, consectetur")
                .font(.system(size: 14))
                .foregroundStyle(.noteTitle)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.textFieldBorder).opacity(0.1))
    }
}

#Preview {
    NoteListingView()
}
