//
//  CharacterNetworkClient.swift
//  RickyAndMortySwiftUI
//
//  Created by Josep Cerdà Penadés on 14/4/23.
//

import Foundation

final class CharacterNetworkClient {
    
    final let baseURL = "https://rickandmortyapi.com/api/"
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

extension CharacterNetworkClient {
    
    func getCharacterList(page: Int) async throws -> ([CharacterEntity], Bool) {
        
        guard let url = URL(string: "\(baseURL)character/?page=\(page)") else {
            throw NetworkError.badURL
        }
        let request = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            let decoder = JSONDecoder()
            do {
                if (200..<300).contains(response.statusCode) {
                    let result = try decoder.decode(CharactersDTO.self, from: data)
                    var hasNextPage = false
                    guard let nextPage = result.info.next else {
                        hasNextPage = false
                        return (result.results.map { $0.toEntity }, hasNextPage)
                    }
                    hasNextPage = !nextPage.isEmpty ? true : false
                    let characList = result.results.map { $0.toEntity }
                    return (characList, hasNextPage)
                } else {
                    throw NetworkError.badResponse
                }
            } catch {
                throw NetworkError.decodeError
            }
        } catch {
            throw NetworkError.badRequest
        }
    }
}
