//
//  DayStoryTabView.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 31.05.2024.
//

import SwiftUI

struct DayStoryTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            GalleryView(selectedTab: $selectedTab)
                .tabItem { Label("Galeri", systemImage: "photo") }
                .tag(0)
            
            TodayView()
                .tabItem { Label("Bugün", systemImage: "calendar") }
                .tag(1)
            
            ProfileView()
                .tabItem { Label("Profil", systemImage: "person") }
                .tag(2)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            DayStoryToolbar()
        }
    }
}

#Preview {
    DayStoryTabView()
}
