//
//  CreateNoteResponseModel.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 7.06.2024.
//

import Foundation

public class CreateEventResponse: Decodable {
    let message: String?
    let statusCode: Int?
    
    enum CodingKeys: String, CodingKey {
        case message, statusCode
    }
}
