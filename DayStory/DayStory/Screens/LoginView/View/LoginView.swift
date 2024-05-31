import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        welcomeBannerView(geometry: geometry)
                        
                        Form {
                            DayStoryTextField(text: $viewModel.userName,
                                              title: "Kullanıcı Adı",
                                              placeholder: "Kullanıcı Adınızı Giriniz",
                                              errorMessage: viewModel.userNameErrorMessage,
                                              textLimit: 50)
                            .padding(.bottom)
                            
                            DayStoryTextField(text: $viewModel.password,
                                              title: "Şifre",
                                              placeholder: "Şifrenizi Giriniz",
                                              isSecure: true,
                                              errorMessage: viewModel.passwordErrorMessage)
                        }
                        .formStyle(.columns)
                        
                        NavigationLink(destination: EmptyView(), isActive: $viewModel.isValid) {}
                        
                        Button(action: {
                            viewModel.validateFields()
                        }) {
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
