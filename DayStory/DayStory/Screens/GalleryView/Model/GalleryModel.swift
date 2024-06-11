//
//  GalleryModel.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 11.06.2024.
//

import Foundation

struct GetAllSummariesResponse: Decodable {
    let statusCode: Int?
    let message: String?
    let data: [ImageModel]?
}
