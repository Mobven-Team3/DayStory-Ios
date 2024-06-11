//
//  TodayResponseModel.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 6.06.2024.
//

import Foundation

struct GetEventsByDayResponse: Decodable {
    let message: String?
    let statusCode: Int?
    let data: [Events]?
}

public struct Events: Decodable {
    let id: Int
    let title: String?
    let description: String?
    let date: String?
    let time: String?
    let priority: String?
}

struct CreateDaySummaryResponse: Decodable {
    let statusCode: Int?
    let message: String?
}

struct GetDaySummariesByDayResponse: Decodable {
    let statusCode: Int?
    let message: String?
    let data: ImageModel?
}

struct ImageModel: Decodable {
    let id: Int?
    let date: String?
    let imagePath: String?
}
