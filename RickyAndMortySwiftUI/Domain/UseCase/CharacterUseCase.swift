//
//  CharacterUseCase.swift
//  RickyAndMortySwiftUI
//
//  Created by Josep Cerdà Penadés on 14/4/23.
//

import Foundation

final class CharacterUseCase {

    private let repository: CharacterRepository

    init(repository: CharacterRepository = CharacterRepository()) {
        self.repository = repository
    }
}

extension CharacterUseCase {
    
    func getCharacterList(page: Int) async throws -> ([CharacterEntity], Bool) {
        do {
            let list = try await repository.getCharacterList(page: page)
            return (list.0, list.1)
        } catch {
            throw error
        }
    }
}
