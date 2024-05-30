//
//  SignupPersonalViewModel.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 30.05.2024.
//

import Foundation

final class SignupPersonalViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var lastName: String = ""
    @Published var selectedGender: String = ""
    @Published var dateOfBirth: Date = Date()
    
    @Published var isValid: Bool = false
    @Published var nameErrorMessage: String? = nil
    @Published var lastNameErrorMessage: String? = nil
    @Published var genderErrorMessage: String? = nil
    
    func validateFields() {
        nameErrorMessage = !name.isValidName ? "Geçerli bir isim giriniz." : nil
        lastNameErrorMessage = !lastName.isValidName ? "Geçerli bir soyisim giriniz." : nil
        genderErrorMessage = selectedGender == "" ? "Lütfen bir cinsiyet seçiniz." : nil
        
        isValid = nameErrorMessage == nil && lastNameErrorMessage == nil && genderErrorMessage == nil
    }
}
