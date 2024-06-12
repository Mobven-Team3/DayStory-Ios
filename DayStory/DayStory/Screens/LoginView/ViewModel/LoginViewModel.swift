//
//  LoginViewModel.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 31.05.2024.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    @Published var isValid: Bool = false
    @Published var emailErrorMessage: String? = nil
    @Published var passwordErrorMessage: String? = nil
    
    @Published var isLoginSuccessful: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    
    func validateFields() {
        emailErrorMessage = !email.isValidUserName ? "Geçerli bir email giriniz." : nil
        passwordErrorMessage = !password.isValidPassword ? "Geçerli bir şifre giriniz." : nil
        
        isValid = emailErrorMessage == nil && passwordErrorMessage == nil
    }
    
    func login(model: LoginUserContract) async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        let result = await API.User.login(user: model).fetch(responseModel: LoginResponseModel.self)
        
        DispatchQueue.main.async {
            switch result {
            case let .success(response):
                if response.statusCode == 200 {
                    self.isLoginSuccessful = true
                    TokenManager.shared.token = response.data?.token
                }
            case let .failure(error):
                self.isLoginSuccessful = false
                if error.localizedDescription.contains("found") {
                    self.errorMessage = "Bu e-posta adresiyle eşleşen bir kullanıcı bulunamadı. Lütfen e-posta adresinizi kontrol edip yeniden deneyin."
                } else if error.localizedDescription.contains("password") {
                    self.errorMessage = "Şifre yanlış. Lütfen şifrenizi kontrol edip yeniden deneyin."
                }
            }
            
            self.isLoading = false
        }
    }
}
