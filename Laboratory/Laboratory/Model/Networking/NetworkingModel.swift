//
//  NetworkingModel.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 11.07.22.
//

import Foundation


class NetworkingModel {
    
    enum NetworkError: Error {
        case invalidURL
    }

    static let shared = NetworkingModel()
  
    public func fetchAlbumWithAsyncURLSession(for targetURL: String) async throws -> ExperimentData {
        guard let url = URL(string: "https://api.shrtco.de/v2/shorten") else {
            throw NetworkError.invalidURL
        }

        // make a request to post a url
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let parameters: [String: Any] = [
            "url": targetURL
        ]
        request.httpBody = parameters.percentEncoded()
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let linkData = try JSONDecoder().decode(ExperimentResponse.self, from: data)
        return linkData.result
    }
}


