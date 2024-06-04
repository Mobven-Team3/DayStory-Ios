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
    
    func validateFields() {
        emailErrorMessage = !email.isValidEmail ? "Geçerli bir email giriniz." : nil
        userNameErrorMessage = !userName.isValidUserName ? "Geçerli bir kullanıcı adı giriniz." : nil
        passwordErrorMessage = !password.isValidPassword ? "En az 7 karakter, 1 büyük harf, 1 küçük harf ve özel karakter." : nil
        confirmPasswordErrorMessage = confirmPassword != password ? "Şifreleriniz aynı olmalıdır." : nil
        
        isValid = emailErrorMessage == nil && userNameErrorMessage == nil && passwordErrorMessage == nil && confirmPasswordErrorMessage == nil
    }
    
    func register(model: RegisterUserContract) async {
        let result = await API.User.register(user: model).fetch(responseModel: SignupAccountResponseModel.self)
        
        switch result {
        case let .success(response):
            DispatchQueue.main.async {
                print(response.token)
            }
        case let .failure(error):
            print(error.localizedDescription)
        }
    }
}
