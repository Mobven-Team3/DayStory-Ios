//
//  LoginResponseModel.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 4.06.2024.
//

import Foundation

struct LoginResponseModel: Decodable {
    let message: String?
    let statusCode: Int?
    let data: Token?

    enum CodingKeys: String, CodingKey {
        case message, statusCode, data
    }
}

struct Token: Decodable {
    let token: String?
}

struct ErrorResponse: Decodable {
    let type: String
    let title: String
    let status: Int
}
