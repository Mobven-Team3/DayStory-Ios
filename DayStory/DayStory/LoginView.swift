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
                ZStack(alignment: .trailing) {
                    TextField("Kullanıcı Adınızı Giriniz", text: $userName)
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
                    SecureField("Şifrenizi Giriniz", text: $password)
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
            }
            .formStyle(.columns)
            .padding()
            
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
    }
}

#Preview {
    LoginView()
}
