//
//  Response.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 17.05.2024.
//

import Foundation

public struct Response<T: Decodable>: Decodable {
    public var data: T?
}
