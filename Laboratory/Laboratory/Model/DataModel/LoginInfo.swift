//
//  Login.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 06.08.22.
//

import Foundation


/// The list of errors that can happen during the sending or requestion data from the server
enum LoginError: Error, CustomStringConvertible {
    case networkError
    case authorization
    case forbidden
    
    var description: String {
        switch self {
        case .networkError:
            return "A network error occured"
        case .authorization:
            return "The username is incorrect"
        case .forbidden:
            return "API rate limit exceeded"
        }
    }
}


/// Store the user data for check the github resume
struct LoginInfo {
    var username: String
    
    /// Fetch the data of the user profile
    ///
    /// - Parameter completionBlock: The block to execute after the operation’s main task is completed
    mutating func fetchProfileData(completion: @escaping (Result<[Login],Error>) -> Void ) {
        
        let task = URLSession.shared.dataTask(with: prepareRequest()) { (data, response, error) in
            
            if error == nil {
                //Check the response from the server
                if let response = response as? HTTPURLResponse {
                    if response.statusCode == 404 {
                        completion(.failure(LoginError.authorization))
                    } else if response.statusCode == 403 {
                        completion(.failure(LoginError.forbidden))
                    }
                }
                do {
                    let userData = try JSONDecoder().decode(Login.self, from: data!)
                    completion(.success([userData]))
                } catch {
                    print(error)
                }
            } else {
                // The error when the network has a problem
                completion(.failure(LoginError.networkError))
            }
        }
        task.resume()
    }
    
    /// Prepare request for the server
    ///
    /// - Returns: The request as URLRequest
    func prepareRequest() -> URLRequest {
        guard let url = URL(string: "https://labsappointment.com/api/identity/users/by-email/{email}") else {fatalError()}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
}





