//
//  CharacterRepository.swift
//  RickyAndMortySwiftUI
//
//  Created by Josep Cerdà Penadés on 14/4/23.
//

import Foundation

class CharacterRepository {
    
    private let client: CharacterNetworkClient
    private let rlient: CharacterRDataClient

    init(client: CharacterNetworkClient = CharacterNetworkClient(),
         rlient: CharacterRDataClient = CharacterRDataClient()) {
        self.client = client
        self.rlient = rlient
    }
}

extension CharacterRepository {

    func getCharacterList(page: Int) async throws -> ([CharacterEntity], Bool) {
        if page == 1 && !Utils.existsConnection() {
            do {
                return (try self.rlient.getCharacterList(), false)
            } catch {
                throw error
            }
        }
        do {
            let list = try await client.getCharacterList(page: page)
            try self.rlient.saveCharacters(characters: list.0)
            return (list)
        } catch {
            throw error
        }
    }
}
