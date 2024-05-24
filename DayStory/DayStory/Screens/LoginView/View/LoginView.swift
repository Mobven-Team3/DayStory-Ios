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
            VStack {
                Text("Day")
                    .foregroundStyle(.dayStoryPurple)
                    .font(.system(size: 24))
                    .fontWeight(.regular)
                +
                Text("Story")
                    .foregroundStyle(.dayStoryPurple)
                    .font(.system(size: 24))
                    .fontWeight(.thin)
                
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
                
                Form {
                    ReusableTextField(text: $userName,
                                      placeholder: "Kullanıcı Adınızı Giriniz")
                    
                    ReusableTextField(text: $password,
                                      placeholder: "Şifrenizi Giriniz",
                                      isSecure: true)
                }
                .formStyle(.columns)
                
                Button {
                    print("tapped")
                } label: {
                    GradientButton(title: "Giriş Yap")
                }
                
                HStack {
                    Text("Henüz hesabın yok mu?")
                        .foregroundStyle(.dayStoryPurple)
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                    
                    Button {
                        print("Kayıt Ol")
                    } label: {
                        Text("Kayıt Ol")
                            .font(Font.system(size: 14))
                            .fontWeight(.bold)
                            .foregroundStyle(.dayStoryPurple)
                            .underline(true)
                    }
                }
                
                Spacer()
            }
            .padding([.trailing, .leading], 10)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    LoginView()
}
