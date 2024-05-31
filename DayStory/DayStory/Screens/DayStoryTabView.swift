//
//  DayStoryTabView.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 31.05.2024.
//

import SwiftUI

struct DayStoryTabView: View {
    var body: some View {
        TabView {
            GalleryView()
                .tabItem { Label("Galeri", systemImage: "photo") }
            
            TodayView()
                .tabItem { Label("Bugün", systemImage: "calendar") }
            
            ProfileView()
                .tabItem { Label("Profil", systemImage: "person") }
        }
    }
}

#Preview {
    DayStoryTabView()
}
