//
//  ExpeimentResponse.swift
//  Laboratory
//
//  Created by mehrnoush abdinian on 11.07.22.
//

import Foundation


struct ExperimentResponse: Decodable {
    let ok: Bool
    let result: ExperimentData
}
