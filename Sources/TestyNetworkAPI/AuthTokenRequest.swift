//
//  File.swift
//  
//
//  Created by Jazek Creacy on 7/19/22.
//

import Foundation

public enum AuthTokenRequest: RequestProtocol {
    
// MARK: finish this
    public var urlParameters: [String : String?] {
        ["none": "none"]
    }
    
    case auth
    
    public var path: String {
        "/v2/oauth2/token"
    }
    
    public var params: [String : String] {
        [
            "grant-type": APIConstants.grantType,
            "client_id": APIConstants.clientId,
            "client_secret": APIConstants.clientSecret
        ]
    }
    
    public var addAuthorizationToken: Bool {
        false
    }
    public var requestType: RequestType {
        .POST
    }
}
