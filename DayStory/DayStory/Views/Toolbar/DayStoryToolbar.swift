//
//  DayStoryToolbar.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 24.05.2024.
//

import SwiftUI

struct DayStoryToolbar: ToolbarContent {
    var body: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            HStack {
                Text("Day")
                    .foregroundStyle(.dayStoryPurple)
                    .font(.system(size: 24))
                    .fontWeight(.regular)
                +
                Text("Story")
                    .foregroundStyle(.dayStoryPurple)
                    .font(.system(size: 24))
                    .fontWeight(.thin)
            }
        }
    }
}
