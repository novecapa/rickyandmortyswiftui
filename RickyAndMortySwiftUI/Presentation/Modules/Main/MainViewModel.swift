//
//  MainViewModel.swift
//  RickyAndMortySwiftUI
//
//  Created by Josep Cerdà Penadés on 14/4/23.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    private let characterUseCase: CharacterUseCase
    
    @Published var charactersList: [CharacterEntity] = []
    
    init(characterUseCase: CharacterUseCase = CharacterUseCase()) {
        self.characterUseCase = characterUseCase
    }
    
    func fetchCharacters() {
        Task {
            let chList = try await characterUseCase.getCharacterList(page: 0)
            DispatchQueue.main.async {
                self.charactersList = chList.0
            }
        }
    }
}
