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
    @Published var errorMessage: String = ""
    
    func validateFields() {
        emailErrorMessage = !email.isValidUserName ? "Geçerli bir email giriniz." : nil
        passwordErrorMessage = !password.isValidPassword ? "Geçerli bir şifre giriniz." : nil
        
        isValid = emailErrorMessage == nil && passwordErrorMessage == nil
    }
    
    func login(model: LoginUserContract) async {
        let result = await API.User.login(user: model).fetch(responseModel: LoginResponseModel.self)
        
        DispatchQueue.main.async {
            switch result {
            case let .success(response):
                self.isLoginSuccessful = true
                TokenManager.shared.token = response.token
            case let .failure(error):
                self.isLoginSuccessful = false
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
