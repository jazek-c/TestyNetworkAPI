//
//  File.swift
//  
//
//  Created by Jazek Creacy on 7/19/22.
//

import Foundation

public protocol RequestManagerProtocol {
    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

public class RequestManager: RequestManagerProtocol {
    
    let apiManager: APIMangerProtocol
    let parser: DataParserProtocol
    
    public init(apiManager: APIMangerProtocol = APIManager(),
                parser: DataParserProtocol = DataParser()) {
        self.apiManager = apiManager
        self.parser = parser
    }
    
  public func requestAccessToken() async throws -> String {
        let data = try await apiManager.requestToken()
        let token: APIToken = try parser.parse(data: data)
        return token.bearerAccessToken
    }
    
    public func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T {
        let authToken = try await requestAccessToken()
        
        let data = try await apiManager.perform(request, authToken: authToken)
        
        let decoded: T = try parser.parse(data: data)
        return decoded
        
        
    }
    
    
}
