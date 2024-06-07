//
//  TodayRequestModel.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 6.06.2024.
//

import Foundation

public struct GetEventsByDayContract: Encodable {
    let date: String?
    
    enum CodingKeys: String, CodingKey {
        case date
    }
}
