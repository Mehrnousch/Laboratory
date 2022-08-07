//
//  Register.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 04.08.22.
//

import Foundation
struct Register: Decodable  {
    
    let userName: String
    let email: String
    let password: String
    
    
    
    internal init(userName: String = "", email: String = "", password: String = "" ) {
        self.userName = userName
        self.email = email
        self.password = password
    }
}

