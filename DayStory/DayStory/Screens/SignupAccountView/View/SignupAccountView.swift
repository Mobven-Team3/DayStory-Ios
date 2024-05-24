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
        NavigationStack {
            VStack(spacing: 15) {
                Text("Day")
                    .foregroundStyle(.dayStoryPurple)
                    .font(.system(size: 24))
                    .fontWeight(.regular)
                +
                Text("Story")
                    .foregroundStyle(.dayStoryPurple)
                    .font(.system(size: 24))
                    .fontWeight(.thin)
                
                SignupSectionView()
                
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
                    
                    NavigationLink(destination: LoginView()) {
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
            .padding([.trailing, .leading], 10)
        }
    }
}

#Preview {
    SignupAccountView()
}
