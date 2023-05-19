//
//  PetitionMainModel.swift
//  Pettition
//
//  Created by Elif Tum on 18.05.2023.
//

import Foundation

struct PetitionMainModel: Codable {
    let results:[PetitionModel]
}
struct PetitionModel: Codable {
    let title: String?
    let body: String?
}
