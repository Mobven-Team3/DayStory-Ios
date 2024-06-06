//
//  TokenManager.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 6.06.2024.
//

import Foundation

final class TokenManager {
    static let shared = TokenManager()
    private let userDefaultsTokenKey = "userToken"
    
    private init() {}
    
    var token: String? {
        get {
            return UserDefaults.standard.string(forKey: userDefaultsTokenKey)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: userDefaultsTokenKey)
        }
    }
}
