
//
//  NetworkingModel.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 04.08.22.
//



import Foundation


class NetworkingModel {
    
    enum NetworkError: Error {
        case invalidURL
    }

    static let shared = NetworkingModel()
  
    public func fetchAlbumWithAsyncURLSession(for targetURL: String) async throws -> Register {
        guard let url = URL(string: "https://labsappointment.com/api/identity/users") else {
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
        
        let RegisterData = try JSONDecoder().decode(RegisterResponse.self, from: data)
        return RegisterData.result
    }
}


