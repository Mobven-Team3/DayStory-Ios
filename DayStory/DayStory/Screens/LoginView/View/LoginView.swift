import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        welcomeBannerView(geometry: geometry)
                        
                        Form {
                            DayStoryTextField(text: $viewModel.email,
                                              title: "Email",
                                              placeholder: "Emailinizi Yazınız",
                                              errorMessage: viewModel.emailErrorMessage,
                                              textLimit: 50)
                            .padding(.bottom)
                            
                            DayStoryTextField(text: $viewModel.password,
                                              title: "Şifre",
                                              placeholder: "Şifrenizi Giriniz",
                                              isSecure: true,
                                              errorMessage: viewModel.passwordErrorMessage,
                                              textLimit: 50)
                        }
                        .formStyle(.columns)
                        
                        NavigationLink(destination: DayStoryTabView(), isActive: $viewModel.isLoginSuccessful) {}
                        
                        Button(action: {
                            viewModel.validateFields()
                            
                            if viewModel.isValid {
                                Task {
                                    let model = LoginUserContract(email: viewModel.email,
                                                                  password: viewModel.password)
                                    await viewModel.login(model: model)
                                    
                                    if !viewModel.isLoginSuccessful {
                                        showAlert = true
                                        alertMessage = viewModel.errorMessage
                                    }
                                }
                            }
                        }) {
                            GradientButton(title: "Giriş Yap")
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("HATA"), message: Text(alertMessage), dismissButton: .default(Text("Tamam")))
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
