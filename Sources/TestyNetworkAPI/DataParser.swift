//
//  File.swift
//  
//
//  Created by Jazek Creacy on 7/19/22.
//

import Foundation

public protocol DataParserProtocol {
    func parse<T: Decodable>(data: Data) throws -> T
}

public class DataParser: DataParserProtocol {
    public private(set) var jsonDecoder: JSONDecoder
    
    public init(jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.jsonDecoder = jsonDecoder
        self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    public func parse<T: Decodable>(data: Data) throws -> T {
        return try jsonDecoder.decode(T.self, from: data)
    }
}
