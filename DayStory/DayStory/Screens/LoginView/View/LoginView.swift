//
//  LoginView.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 23.05.2024.
//

import SwiftUI

struct LoginView: View {
    
    @State var userName = ""
    @State var password = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    welcomeBannerView
                    
                    Form {
                        DayStoryTextField(text: $userName,
                                          placeholder: "Kullanıcı Adınızı Giriniz")
                        
                        DayStoryTextField(text: $password,
                                          placeholder: "Şifrenizi Giriniz",
                                          isSecure: true)
                    }
                    .formStyle(.columns)
                    
                    Button {
                        print("tapped")
                    } label: {
                        GradientButton(title: "Giriş Yap")
                    }
                    
                    LoginPrompt(promptText: "Henüz hesabın yok mu?",
                                linkText: "Kayıt Ol",
                                linkDestination: SignupAccountView())
                }
                .toolbar {
                    DayStoryToolbar()
                }
                .padding([.trailing, .leading], 10)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Views
private extension LoginView {
    var welcomeBannerView: some View {
        ZStack(alignment: .bottom) {
            Image("loginImage")
                .resizable()
                .scaledToFit()
                .frame(height: 374)
                .offset(y: -30)
            
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
                +
                Text("'e Hoşgeldin!")
                    .foregroundStyle(.dayStoryPurple)
                    .font(.system(size: 24))
                    .fontWeight(.regular)
            }
            .padding()
        }
    }
}

#Preview {
    LoginView()
}
