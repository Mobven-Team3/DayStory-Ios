//
//  ContentView.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 17.05.2024.
//

import SwiftUI

struct ContentView: View {
    
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
            .padding(.top)
            
            Text("Hesap Bilgilerinizi Oluşturunuz.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .padding(.top, 40)
            
            Form {
                TextField("Emailinizi Yazınız", text: $email)
                    .padding()
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.none)
                
                Spacer().frame(height: 40)
                
                TextField("Kullanıcı Adı Belirleyiniz", text: $userName)
                    .padding()
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .textInputAutocapitalization(.none)
                
                Spacer().frame(height: 40)
                
                SecureField("Şifre Belirleyiniz", text: $password)
                    .padding()
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    
                
                Spacer().frame(height: 40)
                
                SecureField("Şifrenizi Onaylayınız", text: $confirmPassword)
                    .padding()
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )
            }
            .padding(.top, 40)
            .formStyle(.columns)
            
            Button {
                print("tapped")
            } label: {
                Text("Kayıt Ol")
                    .font(Font.system(size: 15))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(height: 46)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(LinearGradient.actionButton)
                    .clipShape(.capsule)
            }
            .padding(.top, 40)
                
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
        .padding()
    }
}

fileprivate extension LinearGradient {
    static let actionButton = LinearGradient(gradient: Gradient(colors: [Color.buttonPink, Color.buttonPurple]),
                                             startPoint: .topLeading,
                                             endPoint: .center)
}

#Preview {
    ContentView()
}
