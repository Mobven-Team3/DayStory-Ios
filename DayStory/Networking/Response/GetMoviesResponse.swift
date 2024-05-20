//
//  GetMoviesResponse.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 20.05.2024.
//

import Foundation

public struct MovieResponse: Decodable {
    public let title: String?
    
    public init(title: String?) {
        self.title = title
    }
}
