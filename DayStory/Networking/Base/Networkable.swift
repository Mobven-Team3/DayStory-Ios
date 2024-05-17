//
//  Networkable.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 17.05.2024.
//

import Foundation

public protocol Networkable {
    func request() async -> URLRequest
}

public extension Networkable {
    func fetch<T: Decodable>(requestModel model: T.Type) async -> Result<T, Error> {
        do {
            let (data, result) = try await URLSession.shared.data(for: <#T##URLRequest#>)
        } catch {
            
        }
    }
}
