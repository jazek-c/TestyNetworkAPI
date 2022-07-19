//
//  File.swift
//  
//
//  Created by Jazek Creacy on 7/19/22.
//

import Foundation

public enum NetworkError: LocalizedError {
  case invalidServerResponse
  case invalidURL
  public var errorDescription: String? {
    switch self {
    case .invalidServerResponse:
      return "The server returned an invalid response."
    case .invalidURL:
      return "URL string is malformed."
    }
  }
}
