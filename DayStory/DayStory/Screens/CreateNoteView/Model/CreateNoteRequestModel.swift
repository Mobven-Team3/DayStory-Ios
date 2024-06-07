//
//  CreateNoteRequestModel.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 6.06.2024.
//

import Foundation

public struct CreateEventContract: Encodable {
    let title: String?
    let description: String?
    let date: String?
    
    enum CodingKeys: String, CodingKey {
        case title, description, date
    }
}
