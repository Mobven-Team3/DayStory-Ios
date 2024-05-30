import SwiftUI

struct SignupAccountView: View {
    
    @State var email = ""
    @State var userName = ""
    @State var password = ""
    @State var confirmPassword  = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack {
                        SignupSectionView(firstScreen: false)

                        AuthenticationHelperText(text: "Hesap Bilgilerinizi Oluşturunuz.")
                        
                        Form {
                            DayStoryTextField(text: $email,
                                              title: "Email",
                                              placeholder: "Emailinizi Yazınız",
                                              keyboardType: .emailAddress)
                            .padding(.vertical, 8)
                            
                            DayStoryTextField(text: $userName,
                                              title: "Kullanıcı Adı",
                                              placeholder: "Kullanıcı Adı Belirleyiniz")
                            .padding(.bottom, 8)
                            
                            DayStoryTextField(text: $password,
                                              title: "Şifre",
                                              placeholder: "Şifre Belirleyiniz",
                                              isSecure: true)
                            .padding(.bottom, 8)
                            
                            DayStoryTextField(text: $confirmPassword,
                                              title: "Şifre Tekrarı",
                                              placeholder: "Şifrenizi Onaylayınız",
                                              isSecure: true)
                        }
                        .formStyle(.columns)
                    }
                    .padding([.trailing, .leading], 10)
                }
                
                VStack {
                    Button {
                        print("tapped")
                    } label: {
                        GradientButton(title: "Kayıt Ol")
                    }
                    .padding(.bottom, 8)
                    
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
