//
//  SignupAccountModel.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 3.06.2024.
//

import Foundation

public struct RegisterUserContract: Encodable {
    let firstName: String
    let lastName: String
    let userName: String
    let email: String
    let password: String
    let passwordConfirmed: String
    let birthDate: String
    let gender: Int
    
    enum CodingKeys: String, CodingKey {
        case firstName, lastName, email, password, passwordConfirmed, birthDate, gender
        case userName = "username"
    }
}
