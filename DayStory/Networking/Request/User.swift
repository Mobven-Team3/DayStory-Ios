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
        case eventCreate(event: CreateEventContract)
        case getEventsByDay(date: String)
        
        public func request() async -> URLRequest {
            switch self {
            case let .register(user):
                await postRequest(data: user, path: "api/Users/register")
            case let .login(user):
                await postRequest(data: user, path: "api/Users/login")
            case let .eventCreate(event):
                await postRequest(data: event, path: "api/Events/", token: TokenManager.shared.token)
            case let .getEventsByDay(date):
                await getRequest(path: "api/Events/day?date=\(date)", token: TokenManager.shared.token)
            }
        }
    }
}
