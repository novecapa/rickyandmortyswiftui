//
//  NetworkError.swift
//  RickyAndMortySwiftUI
//
//  Created by Josep Cerdà Penadés on 14/4/23.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badResponse
    case decodeError
    case badRequest
    case invalidResponse
}
