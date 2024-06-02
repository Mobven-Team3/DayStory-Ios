import SwiftUI

struct SignupAccountView: View {
    
    @StateObject private var viewModel = SignupAccountViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack {
                        SignupSectionView(firstScreen: false)

                        AuthenticationHelperText(text: "Hesap Bilgilerinizi Oluşturunuz.")
                        
                        Form {
                            DayStoryTextField(text: $viewModel.email,
                                              title: "Email",
                                              placeholder: "Emailinizi Yazınız",
                                              keyboardType: .emailAddress,
                                              errorMessage: viewModel.emailErrorMessage)
                            .padding(.vertical, 8)
                            
                            DayStoryTextField(text: $viewModel.userName,
                                              title: "Kullanıcı Adı",
                                              placeholder: "Kullanıcı Adı Belirleyiniz",
                                              errorMessage: viewModel.userNameErrorMessage,
                                              textLimit: 50)
                            .padding(.bottom, 8)
                            
                            DayStoryTextField(text: $viewModel.password,
                                              title: "Şifre",
                                              placeholder: "Şifre Belirleyiniz",
                                              isSecure: true,
                                              errorMessage: viewModel.passwordErrorMessage)
                            .padding(.bottom, 8)
                            
                            DayStoryTextField(text: $viewModel.confirmPassword,
                                              title: "Şifre Tekrarı",
                                              placeholder: "Şifrenizi Onaylayınız",
                                              isSecure: true,
                                              errorMessage: viewModel.confirmPasswordErrorMessage)
                        }
                        .formStyle(.columns)
                    }
                    .padding([.trailing, .leading], 10)
                }
                
                VStack {
                    NavigationLink(destination: DayStoryTabView(), isActive: $viewModel.isValid) {}
                    
                    Button(action: {
                        viewModel.validateFields()
                    }) {
                        GradientButton(title: "Devam")
                    }
                    .padding(.bottom, 10)
                    
                    LoginPrompt(promptText: "Zaten bir hesabın var mı?",
                                linkText: "Giriş Yap",
                                linkDestination: LoginView())
                }
                .padding(.bottom, 10)
            }
            .toolbar {
                DayStoryToolbar()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarRole(.editor)
        }
    }
}

#Preview {
    SignupAccountView()
}
