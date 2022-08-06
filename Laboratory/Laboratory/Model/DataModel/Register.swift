//
//  Register.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 04.08.22.
//

import Foundation
struct Register: Decodable  {
    
    let userName: String
    let password: String
    let email: String
    
    
    internal init(userName: String = "", password: String = "", email: String = "" ) {
        self.userName = userName
        self.password = password
        self.email = email
    }
}

