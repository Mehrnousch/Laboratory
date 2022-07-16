//
//  ExperimentDatails.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 13.07.22.
//

import Foundation

struct ExperimentDetails {
    
    let name: String
    let person: String
    let experimentDate: String
    
    init(name: String, person: String, experimentDate: String) {
        self.name = name
        self.person = person
        self.experimentDate = experimentDate
        
    }
}

