//
//  File.swift
//  
//
//  Created by Jazek Creacy on 7/19/22.
//

import Foundation

public protocol APIMangerProtocol {
    func perform(_ request: RequestProtocol, authToken: String) async throws -> Data
    func requestToken() async throws -> Data
}

public class APIManager: APIMangerProtocol {
    private let urlSession: URLSession
    
    public init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    public func perform(_ request: RequestProtocol, authToken: String) async throws -> Data {
        let (data, response) = try await urlSession.data(for: request.createURLRequest(authToken: authToken))
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        return data
    }
    
    public func requestToken() async throws -> Data {
        try await perform(AuthTokenRequest.auth, authToken: "")
    }
    
}
