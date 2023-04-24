//
//  CharacterEntity.swift
//  RickyAndMortySwiftUI
//
//  Created by Josep Cerdà Penadés on 14/4/23.
//

import Foundation
import UIKit

struct CharacterEntity: Equatable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let image: String
    let location: String
    let episode: [String]
    
    static func ==(lhs: CharacterEntity, rhs: CharacterEntity) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}

extension CharacterEntity {
    var isAlive: String {
        switch status.lowercased() {
        case "alive":
            return "🙂"
        case "dead":
            return "☠️"
        default:
            return "🫤"
        }
    }
}
