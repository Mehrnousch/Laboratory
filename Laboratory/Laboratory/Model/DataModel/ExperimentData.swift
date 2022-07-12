//
//  ExperimentData.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 11.07.22.
//

import Foundation

struct ExperimentData: Decodable {
 
    let full_short_link: String
    let original_link: String
    
    internal init(full_short_link: String = "", original_link: String = "") {
        self.full_short_link = full_short_link
        self.original_link = original_link
    }
}
