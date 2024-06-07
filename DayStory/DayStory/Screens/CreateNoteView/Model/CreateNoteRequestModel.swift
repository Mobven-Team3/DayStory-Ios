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
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(date, forKey: .date)
        if let description = description, !description.isEmpty {
            try container.encode(description, forKey: .description)
        }
    }
}

public struct UpdateEventContract: Encodable {
    let id: Int?
    let title: String?
    let description: String?
    let date: String?
}
