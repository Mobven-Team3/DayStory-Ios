//
//  AuthenticationText.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 24.05.2024.
//

import SwiftUI

struct AuthenticationHelperText: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 16))
            .fontWeight(.semibold)
            .padding()
    }
}
