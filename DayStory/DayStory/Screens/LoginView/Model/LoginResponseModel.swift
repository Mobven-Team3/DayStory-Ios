//
//  LoginResponseModel.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 4.06.2024.
//

import Foundation

struct LoginResponseModel: Decodable {
    let token: String?

    enum CodingKeys: String, CodingKey {
        case token
    }
}
