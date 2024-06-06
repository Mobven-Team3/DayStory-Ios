//
//  SignupAccountResponseModel.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 4.06.2024.
//

import Foundation

struct SignupnResponseModel: Decodable {
    let success: Bool
    let message: String
    let response: TokenResponse
}
