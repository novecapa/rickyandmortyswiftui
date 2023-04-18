//
//  CharacterRDataClient.swift
//  RickyAndMortySwiftUI
//
//  Created by Josep Cerdà Penadés on 14/4/23.
//

import Foundation
import RealmSwift

final class CharacterRDataClient {
    
    func saveCharacters(characters: [CharacterEntity]) throws {
        do {
            let realm = try Realm()
            var newCharacters: [RCharacter] = []
            characters.forEach { cha in
                newCharacters.append(RCharacter(id: cha.id,
                                                name: cha.name,
                                                status: cha.status,
                                                image: cha.image,
                                                location: cha.location,
                                                episode: cha.episode.map { $0 }))
            }
            try realm.write {
                realm.add(newCharacters, update: .modified)
            }
        } catch {
            throw error
        }
    }
    
    func getCharacterList() throws -> ([CharacterEntity]) {
        do {
            var characters: [CharacterEntity] = []
            let realm = try Realm()
            let rcharacters = Array(realm.objects(RCharacter.self))
            rcharacters.forEach { rchar in
                characters.append(rchar.toEntity)
            }
            return characters
        } catch {
            throw error
        }
    }
}
