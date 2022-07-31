//
//  ExperimentDatails.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 13.07.22.
//

import Foundation

struct ExperimentDetails {
    
    let expermintId: Int
    let experimentName: String
    let experimentLabor: String
    let experimentDate: String
    let text: [String]
    
    
    init(expermintId: Int, experimentName: String, experimentLabor: String, experimentDate: String, text: [String] ) {
        self.expermintId = expermintId
        self.experimentName = experimentName
        self.experimentLabor = experimentLabor
        self.experimentDate = experimentDate
        self.text = text
       
        
    }
}

