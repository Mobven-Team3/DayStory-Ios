//
//  Movie.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 17.05.2024.
//

import Foundation

public extension API {
    enum User: Networkable {
        case register(user: RegisterUserContract)
        case login(user: LoginUserContract)
        
        public func request() async -> URLRequest {
            switch self {
            case let .register(user):
                await postRequest(data: user, path: "api/Users/register")
            case let .login(user):
                await postRequest(data: user, path: "api/Users/login")
            }
        }
    }
}
