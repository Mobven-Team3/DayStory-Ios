//
//  SignupAccountResponseModel.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 4.06.2024.
//

import Foundation

struct SignupResponseModel: Decodable {
    let statusCode: Int?
    let message: String?
}
