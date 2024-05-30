//
//  String+Extensions.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 30.05.2024.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*(),.?\":{}|<>])[A-Za-z\\d!@#$%^&*(),.?\":{}|<>]{7,}$").evaluate(with: self)
    }
    
    var isValidName: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^[a-zA-Z]+$").evaluate(with: self)
    }
}
