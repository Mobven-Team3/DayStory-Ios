//
//  Networkable+Extensions.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 17.05.2024.
//

import Foundation

extension Networkable {
    func getRequest(
        queryItem: [String : String] = [:],
        path: String,
        httpMethod: RequestMethod = .get
    ) async -> URLRequest {
        let url = API.prepareUrl(withPath: path)
        let request = await prepareRequest(url: url,
                                           method: httpMethod,
                                           contentType: ContentType.json)
        return request
    }
    
    func postRequest<T: Encodable> (
        data: T,
        path: String,
        httpMethod: RequestMethod = .post,
        token: String? = nil
    ) async -> URLRequest {
        let url = API.prepareUrl(withPath: path)
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = API.getHeader(contentType: ContentType.json, token: token)
        
        do {
            request.httpBody = try JSONEncoder().encode(data)
        } catch {
            print("Encoding error \(error.localizedDescription)")
        }
        
        return request
    }
    
    private func prepareRequest(
        url: URL,
        method: RequestMethod,
        contentType: ContentType
    ) async -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = API.getHeader(contentType: contentType)
        return request
    }
}
