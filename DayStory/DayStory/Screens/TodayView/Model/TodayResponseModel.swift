//
//  TodayResponseModel.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 6.06.2024.
//

import Foundation

public struct GetEventsByDayResponse: Decodable {
    let Id: Int?
    let title: String?
    let description: String?
    let date: String?
    let time: String?
    let priority: String?
    
    enum CodingKeys: String, CodingKey {
        case Id, title, description, date, time, priority
    }
}
