//
//  LoginRequestModel.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 4.06.2024.
//

import Foundation

public struct LoginUserContract: Encodable {
    let email: String
    let password: String
}
