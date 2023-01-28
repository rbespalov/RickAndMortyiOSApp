//
//  RMCharacter.swift
//  RickAndMorty
//
//  Created by Роман Беспалов on 28.01.2023.
//

import Foundation

struct RMCharacter: Codable {
    let id: Int
    let name: String
    let status: RMCharacteStatus
    let species: String
    let type: String
    let gender: RMCaracterGender
    let origin: RMOrigin
    let location: RMSingleLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}



