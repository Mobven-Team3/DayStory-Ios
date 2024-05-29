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
            ScrollView {
                VStack() {
                    SignupSectionView()

                    AuthenticationHelperText(text: "Hesap Bilgilerinizi Oluşturunuz.")
                    
                    Form {
                        DayStoryTextField(text: $email,
                                          placeholder: "Emailinizi Yazınız",
                                          keyboardType: .emailAddress)
                        
                        DayStoryTextField(text: $userName,
                                          placeholder: "Kullanıcı Adı Belirleyiniz")
                        
                        DayStoryTextField(text: $password,
                                          placeholder: "Şifre Belirleyiniz",
                                          isSecure: true)
                        
                        DayStoryTextField(text: $confirmPassword,
                                          placeholder: "Şifrenizi Onaylayınız",
                                          isSecure: true)
                    }
                    .formStyle(.columns)
                    
                    Button {
                        print("tapped")
                    } label: {
                        GradientButton(title: "Kayıt Ol")
                    }
                    
                    LoginPrompt(promptText: "Zaten bir hesabın var mı?",
                                linkText: "Giriş Yap",
                                linkDestination: LoginView())
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

#Preview {
    SignupAccountView()
}
