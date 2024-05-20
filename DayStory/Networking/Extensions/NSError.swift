//
//  NSError.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 17.05.2024.
//

import Foundation

public extension NSError {
    static var generic: Error {
        NSError(domain: "", code: -1, userInfo: [:])
    }
    
    static func genericError(message: String) -> NSError {
        NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey : message])
    }
}
