//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Роман Беспалов on 28.01.2023.
//

import Foundation

/// Object that represents a single API call
final class RMRequest {
    
    /// API Constants
    private struct Constants {
        static let baseURL = "https://rickandmortyapi.com/api"
    }
    
    /// Desired endpoint
    private let endpoint: RMEndpoint
    
    /// Path components for API, if any
    private let pathCompinents: Set<String>
    
    /// Query parametr for API, if any
    private let queryParameters: [URLQueryItem]
    
    
    /// Constructed URL for the api request in string format
    private var urlString: String {
        var string = Constants.baseURL
        string += "/"
        string += endpoint.rawValue
        
        if !pathCompinents.isEmpty {
            pathCompinents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        return string
    }
    
    /// Computed and constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Desired http method
    public let httpMethod = "GET"
    
    // MARK: - Public
    
    /// Construct request
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathCompinents: Collection of Path components
    ///   - queryParameters: Collection of querry parametrs
    public init(
        endpoint: RMEndpoint,
        pathCompinents: Set<String> = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathCompinents = pathCompinents
        self.queryParameters = queryParameters
    }
}
