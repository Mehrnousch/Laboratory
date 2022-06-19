//
//  Authentication.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 12.06.22.
//

import Foundation

public struct LoginAuthentication {
    
    public let email: String
    public let password: String
    
    public init(email: String = "", password: String = "") {
        self.email = email
        self.password = password
    }
}
