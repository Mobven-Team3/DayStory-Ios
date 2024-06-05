//
//  LoginResponseModel.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 4.06.2024.
//

import Foundation

struct LoginResponseModel: Decodable {
    let success: Bool
    let message: String
    let response: TokenResponse
}

struct TokenResponse: Decodable {
    let token: String
}
