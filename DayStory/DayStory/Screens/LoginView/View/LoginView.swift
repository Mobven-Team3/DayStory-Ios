import SwiftUI

struct LoginView: View {
    
    @State var userName = ""
    @State var password = ""
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        welcomeBannerView(geometry: geometry)
                        
                        Form {
                            DayStoryTextField(text: $userName,
                                              title: "Kullanıcı Adı",
                                              placeholder: "Kullanıcı Adınızı Giriniz")
                            .padding(.bottom)
                            
                            DayStoryTextField(text: $password,
                                              title: "Şifre",
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
                                    linkDestination: SignupPersonalView())
                    }
                    .toolbar {
                        DayStoryToolbar()
                    }
                    .padding([.trailing, .leading], 10)
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

// MARK: - Views
private extension LoginView {
    func welcomeBannerView(geometry: GeometryProxy) -> some View {
        ZStack(alignment: .bottom) {
            Image("loginImage")
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.height * 0.5)
                .position(x: geometry.size.width / 2.1, y: geometry.size.height / 4.2)
            
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
            .offset(y: -5)
        }
    }
}

#Preview {
    LoginView()
}
