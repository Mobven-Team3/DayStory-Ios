//
//  String+Extensions.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 30.05.2024.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3,}").evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-ZÇĞİÖŞÜ])(?=.*[a-zçğıöşü])(?=.*\\d)(?=.*[!@#$%^&*(),.?\":{}|<>])(?!.*\\s).{7,}$").evaluate(with: self)
    }
    
    var isValidName: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^[a-zA-ZçÇğĞıİöÖşŞüÜ ]{2,}$").evaluate(with: self)
    }
    
    var isValidUserName: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^.{3,}$").evaluate(with: self)
    }
}
