//
//  Bundle+Extensions.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 17.05.2024.
//

import Foundation

public extension Bundle {
    func infoForKey(_ key: String) -> String? {
        (infoDictionary?[key] as? String)?.replacingOccurrences(of: "\\", with: "")
    }
}
