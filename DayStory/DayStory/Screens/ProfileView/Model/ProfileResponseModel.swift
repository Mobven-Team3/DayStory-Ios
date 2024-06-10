//
//  ProfileResponseModel.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 10.06.2024.
//

import Foundation

struct UserInfoResponse: Decodable {
    let message: String?
    let statusCode: Int?
    let data: GetUserContract?

    enum CodingKeys: String, CodingKey {
        case message, statusCode, data
    }
}

public struct GetUserContract: Decodable {
    let id: Int
    let firstName: String
    let lastName: String
    let userName: String
    let email: String
    let birthDate: String
    let gender: String
    
    enum CodingKeys: String, CodingKey {
        case id, firstName, lastName, email, birthDate, gender
        case userName = "username"
    }
}

