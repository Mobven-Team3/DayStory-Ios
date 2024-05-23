//
//  ContentView.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 17.05.2024.
//

import SwiftUI

struct SignupAccountView: View {
    
    @State var email = ""
    @State var userName = ""
    @State var password = ""
    @State var confirmPassword  = ""
    
    var body: some View {
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
            
            HStack {
                Rectangle()
                    .frame(height: 4)
                    .foregroundColor(.dayStoryPurple.opacity(0.5))
                    .clipShape(.capsule)
                
                Spacer()
                
                Rectangle()
                    .frame(height: 4)
                    .foregroundColor(.dayStoryPurple)
                    .clipShape(.capsule)
            }
            .padding()
            
            Text("Hesap Bilgilerinizi Oluşturunuz.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .padding()
            
            Form {
                ReusableTextField(text: $email,
                                  placeholder: "Emailinizi Yazınız",
                                  keyboardType: .emailAddress)
                
                ReusableTextField(text: $userName,
                                  placeholder: "Kullanıcı Adı Belirleyiniz")
                
                ReusableTextField(text: $password,
                                  placeholder: "Şifre Belirleyiniz",
                                  isSecure: true)
                
                ReusableTextField(text: $confirmPassword,
                                  placeholder: "Şifrenizi Onaylayınız",
                                  isSecure: true)
            }
            .formStyle(.columns)
            
            Button {
                print("tapped")
            } label: {
                GradientButton(title: "Kayıt Ol")
            }
            
            HStack {
                Text("Zaten hesabın var mı?")
                    .foregroundStyle(.dayStoryPurple)
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                
                Button {
                    print("Giriş Yap")
                } label: {
                    Text("Giriş Yap")
                        .font(Font.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundStyle(.dayStoryPurple)
                        .underline(true)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    SignupAccountView()
}
