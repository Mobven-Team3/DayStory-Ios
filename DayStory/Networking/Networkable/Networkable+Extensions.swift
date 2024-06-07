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
        httpMethod: RequestMethod = .get,
        token: String? = nil
    ) async -> URLRequest {
        let url = API.prepareUrl(withPath: path)
        let request = await prepareRequest(url: url,
                                           method: httpMethod,
                                           contentType: ContentType.json,
                                           token: token)
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
    
    func updateRequest<T: Encodable>(
        data: T,
        path: String,
        httpMethod: RequestMethod = .put,
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
    
    func deleteRequest(
        path: String,
        httpMethod: RequestMethod = .delete,
        token: String? = nil
    ) async -> URLRequest {
        let url = API.prepareUrl(withPath: path)
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = API.getHeader(contentType: ContentType.json, token: token)
        return request
    }
    
    private func prepareRequest(
        url: URL,
        method: RequestMethod,
        contentType: ContentType,
        token: String? = nil
    ) async -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = API.getHeader(contentType: contentType, token: token)
        return request
    }
}
