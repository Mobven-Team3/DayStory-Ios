import SwiftUI

struct SignupAccountView: View {
    
    @StateObject private var viewModel = SignupAccountViewModel()
    
    var name: String?
    var lastName: String?
    var gender: String?
    var birthDay: String?
    
    @State private var showAlert = false
    @State private var alertMessage = ""
    
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
                                              errorMessage: viewModel.emailErrorMessage,
                                              textLimit: 50)
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
                                              errorMessage: viewModel.passwordErrorMessage,
                                              textLimit: 50)
                            .padding(.bottom, 8)
                            
                            DayStoryTextField(text: $viewModel.confirmPassword,
                                              title: "Şifre Tekrarı",
                                              placeholder: "Şifrenizi Onaylayınız",
                                              isSecure: true,
                                              errorMessage: viewModel.confirmPasswordErrorMessage,
                                              textLimit: 50)
                        }
                        .formStyle(.columns)
                    }
                    .padding([.trailing, .leading], 10)
                }
                
                VStack {
                    NavigationLink(destination: LoginView(), isActive: $viewModel.isSignupSuccessful) {}
                    
                    Button(action: {
                        viewModel.validateFields()
                        
                        if viewModel.isValid {
                            Task {
                                let model = RegisterUserContract(firstName: name!,
                                                                 lastName: lastName!,
                                                                 userName: viewModel.userName,
                                                                 email: viewModel.email,
                                                                 password: viewModel.password,
                                                                 passwordConfirmed: viewModel.confirmPassword,
                                                                 birthDate: birthDay!,
                                                                 gender: convertGender(gender: gender!))
                                await viewModel.register(model: model)
                                
                                if !viewModel.isSignupSuccessful {
                                    showAlert = true
                                    alertMessage = viewModel.errorMessage
                                }
                            }
                        }
                    }) {
                        GradientButton(title: "Devam")
                    }
                    .padding(.bottom, 10)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("HATA"), message: Text(alertMessage), dismissButton: .default(Text("Tamam")))
                    }
                    
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
    
    func convertGender(gender: String) -> String {
        switch gender {
        case "Kadın":
            return "Female"
        case "Erkek":
            return "Male"
        case "Belirtme":
            return "NotSpecified"
        case "Diğer":
            return "Other"
        default:
            return "NotSpecified"
        }
    }
}

#Preview {
    SignupAccountView()
}
