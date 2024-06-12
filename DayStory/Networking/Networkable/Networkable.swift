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

import Foundation

public extension Networkable {
    func fetch<T: Decodable>(responseModel model: T.Type) async -> Result<T, Error> {
        do {
            let request = await request()
            printRequest(from: request)
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            
            guard let response = response as? HTTPURLResponse else {
                return .failure(NSError.generic)
            }
            
            switch response.statusCode {
            case 200...299:
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let decodingData = try decoder.decode(T.self, from: data)
                return .success(decodingData)
                
            default:
                if let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) {
                    return .failure(NSError(domain: errorResponse.type, code: errorResponse.status, userInfo: [NSLocalizedDescriptionKey: errorResponse.title]))
                } else {
                    return .failure(NSError.generic)
                }
            }
        } catch {
            return .failure(NSError.generic)
        }
    }
    
    func printRequest(from urlRequest: URLRequest) {
        guard let httpBody = urlRequest.httpBody else {
            return
        }
        
        if let jsonObject = try? JSONSerialization.jsonObject(with: httpBody, options: []),
           let prettyPrintedData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted),
           let prettyPrintedString = String(data: prettyPrintedData, encoding: .utf8) {
            print("---------------------------------")
            print("---------------------------------")
            print("Network Request for endpoint: \(urlRequest.url?.absoluteString ?? "")\n \(prettyPrintedString)")
            print("---------------------------------")
            print("---------------------------------")
        }
    }
}
