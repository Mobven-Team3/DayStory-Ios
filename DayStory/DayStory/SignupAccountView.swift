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
                ZStack(alignment: .trailing) {
                    TextField("Emailinizi Yazınız", text: $email)
                        .padding()
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                    
                    Button {
                        email = ""
                    } label: {
                        Image(systemName: "x.circle")
                            .imageScale(.large)
                            .frame(width: 44, height: 44)
                            .foregroundColor(.dayStoryPurple)
                    }
                }
                
                Spacer().frame(height: 40)
                
                ZStack(alignment: .trailing) {
                    TextField("Kullanıcı Adı Belirleyiniz", text: $userName)
                        .padding()
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .textInputAutocapitalization(.none)
                    
                    Button {
                        userName = ""
                    } label: {
                        Image(systemName: "x.circle")
                            .imageScale(.large)
                            .frame(width: 44, height: 44)
                            .foregroundColor(.dayStoryPurple)
                    }
                }
                
                
                Spacer().frame(height: 40)
                
                ZStack(alignment: .trailing) {
                    SecureField("Şifre Belirleyiniz", text: $password)
                        .padding()
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    
                    Button {
                        password = ""
                    } label: {
                        Image(systemName: "x.circle")
                            .imageScale(.large)
                            .frame(width: 44, height: 44)
                            .foregroundColor(.dayStoryPurple)
                    }
                }
                
                Spacer().frame(height: 40)
                
                ZStack(alignment: .trailing) {
                    SecureField("Şifrenizi Onaylayınız", text: $confirmPassword)
                        .padding()
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    
                    Button {
                        confirmPassword = ""
                    } label: {
                        Image(systemName: "x.circle")
                            .imageScale(.large)
                            .frame(width: 44, height: 44)
                            .foregroundColor(.dayStoryPurple)
                    }
                }
            }
            .padding()
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

extension LinearGradient {
    static let actionButton = LinearGradient(gradient: Gradient(colors: [Color.buttonPink, Color.buttonPurple]),
                                             startPoint: .leading,
                                             endPoint: .center)
}

#Preview {
    SignupAccountView()
}
