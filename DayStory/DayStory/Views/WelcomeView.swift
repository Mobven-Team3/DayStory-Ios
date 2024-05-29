//
//  WelcomeView.swift
//  DayStory
//
//  Created by Mobven on 23.05.2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("daystoryonboarding")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 409, height: 409)
                    .padding()
                
                VStack {
                    HStack(spacing: 0) {
                        Text("Day")
                            .font(.largeTitle)
                            .fontWeight(.medium)
                        //                     .frame(width: 334, height: 84)
                            .foregroundColor(Color.dayStoryTextColor)
                        Text("Story")
                            .font(.largeTitle)
                            .fontWeight(.thin)
                            .foregroundColor(.dayStoryTextColor)
                    }
                    .padding(.top, -75)
                    Text("Her sayfanın bir hikaye anlattığı yer")
                        .foregroundColor(.dayStoryTextColor)
                        .fontWeight(Font.Weight.medium)
                        .padding(-30)
                }
                Spacer()
                VStack(spacing: 15) {
                    NavigationLink(destination: SignUp()){
                        Text("Yeni hesap oluştur")
                            .foregroundColor(.white)
                            .font(.body)
                    }
//                    Button {
//                        
//                        
//                    } label: {
//                        Text("Yeni Hesap Oluştur")
//                            .foregroundColor(.white)
//                            .font(.body)
//                    }
                    
                    .padding(.all)
                    .frame(width: 351, height: 46)
                    .background(LinearGradient(colors: [.buttonColor2, .buttonColor1], startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(50)
                    
                    NavigationLink(destination: SignUp()) {
                        Text("Hesabım Var")
                            .foregroundColor(.buttonColor1)
                            .font(.body)
                            .frame(width: 351, height: 46)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.buttonColor1))
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

