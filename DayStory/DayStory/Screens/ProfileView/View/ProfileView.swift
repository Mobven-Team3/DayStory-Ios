//
//  ProfileView.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 31.05.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        VStack {
            ScrollView {
                Spacer()
                    .frame(height: 50)
                ZStack {
                    Circle()
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: [.todayScreenText, .buttonPink]),
                                startPoint: .center,
                                endPoint: .bottom
                            ),
                            lineWidth: 3
                        )
                        .frame(width: 110, height: 100)
                    
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .fontWeight(.ultraLight)
                }
                .padding()
                
                Text(viewModel.userInfo?.userName ?? "")
                    .font(.callout)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    RowView(imageName: "person.text.rectangle",
                            text: "\(viewModel.userInfo?.firstName ?? "") \(viewModel.userInfo?.lastName ?? "")")
                    RowView(imageName: "envelope", text: viewModel.userInfo?.email ?? "")
                    RowView(imageName: "calendar", text: viewModel.userInfo?.birthDate.replacingOccurrences(of: "-", with: "/") ?? "")
                    RowView(imageName: "person.2", text: convertGenderReverse(gender: viewModel.userInfo?.gender ?? ""))
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 1))
                .padding(.all, 30)
            }
                        
            Button {
                
            } label: {
                Text("Çıkış Yap")
                    .foregroundStyle(.todayScreenText)
                    .font(.system(size: 14, weight: .semibold))
                    .frame(height: 46)
                    .frame(maxWidth: .infinity)
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.textFieldBorder))
                    .padding(.all, 30)
            }
        }
        .onAppear {
            Task {
                await viewModel.getUserInfos()
            }
        }
        .toolbar {
            DayStoryToolbar()
        }
    }
    
    func convertGenderReverse(gender: String) -> String {
        switch gender {
        case "Female":
            return "Kadın"
        case "Male":
            return "Erkek"
        case "NotSpecified":
            return "Belirtme"
        case "Other":
            return "Diğer"
        default:
            return "Belirtme"
        }
    }
}

struct RowView: View {
    var imageName: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .frame(width: 24, height: 24)
            
            Text(text)
                .font(.system(size: 14))
        }
    }
}

#Preview {
    ProfileView()
}
