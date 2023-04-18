//
//  CharacterEntity.swift
//  RickyAndMortySwiftUI
//
//  Created by Josep Cerdà Penadés on 14/4/23.
//

import Foundation
import UIKit

struct CharacterEntity {
    let id: Int
    let name: String
    let status: String
    let image: String
    let location: String
    let episode: [String]
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
