//
//  WelcomeView.swift
//  DayStory
//
//  Created by Mobven on 23.05.2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("daystoryOnboarding")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 409, height: 409)
                    .padding()
                
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
                    .padding(.top, -75)
                    
                    Text("Her sayfanın bir hikaye anlattığı yer")
                        .foregroundStyle(.dayStoryPurple)
                        .fontWeight(Font.Weight.medium)
                        .padding(-30)
                }
                
                Spacer()
                
                VStack() {
                    NavigationLink(destination: SignupPersonalView()){
                        GradientButton(title: "Yeni Hesap Oluştur")
                    }
                    
                    NavigationLink(destination: LoginView()) {
                        Text("Hesabım Var")
                            .foregroundStyle(.buttonPurple)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(height: 46)
                            .frame(maxWidth: .infinity)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.buttonPurple))
                            .padding()
                    }
                }
                Spacer()
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

