//
//  SignupAccountViewModel.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 30.05.2024.
//

import Foundation

final class SignupAccountViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var userName = ""
    @Published var password = ""
    @Published var confirmPassword  = ""
    
    @Published var isValid: Bool = false
    @Published var emailErrorMessage: String? = nil
    @Published var userNameErrorMessage: String? = nil
    @Published var passwordErrorMessage: String? = nil
    @Published var confirmPasswordErrorMessage: String? = nil
    
    @Published var isSignupSuccessful: Bool = false
    @Published var errorMessage: String = ""
    
    func validateFields() {
        emailErrorMessage = !email.isValidEmail ? "Geçerli bir email giriniz." : nil
        userNameErrorMessage = !userName.isValidUserName ? "Geçerli bir kullanıcı adı giriniz." : nil
        passwordErrorMessage = !password.isValidPassword ? "En az 7 karakter, 1 büyük harf, 1 küçük harf ve özel karakter." : nil
        confirmPasswordErrorMessage = confirmPassword != password ? "Şifreleriniz aynı olmalıdır." : nil
        
        isValid = emailErrorMessage == nil && userNameErrorMessage == nil && passwordErrorMessage == nil && confirmPasswordErrorMessage == nil
    }
    
    func register(model: RegisterUserContract) async {
        let result = await API.User.register(user: model).fetch(responseModel: SignupResponseModel.self)
        
        DispatchQueue.main.async {
            switch result {
            case let .success(response):
                if response.statusCode == 200 {
                    self.isSignupSuccessful = true
                }
            case let .failure(error):
                self.isSignupSuccessful = false
                if error.localizedDescription.contains(self.email) {
                    self.errorMessage = "Bu e-posta adresi zaten bulunmaktadır."
                } else if error.localizedDescription.contains(self.userName) {
                    self.errorMessage = "Bu kullanıcı adı zaten bulunmaktadır."
                }
            }
        }
    }
}
