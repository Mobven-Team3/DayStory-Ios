//
//  DetailScreenView.swift
//  DayStory
//
//  Created by Mobven on 31.05.2024.
//

import SwiftUI

struct DetailScreenView: View {
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Text("gg.aa.yy")
                        .font(.system(size: 16))
                        .padding()
                    
                    Image("daystoryOnboarding")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 335, height: 335)
                }
                .padding()
                
                Text("Notlar")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .padding(.bottom)
                
                /*VStack(spacing: 25) {
                 ForEach(0..<3) {_ in
                 NoteListingView()
                 }
                 }*/
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            DayStoryToolbar()
        }
    }
}
struct DetailScreenView_Previews : PreviewProvider {
    static var previews: some View {
        DetailScreenView()
    }
}

