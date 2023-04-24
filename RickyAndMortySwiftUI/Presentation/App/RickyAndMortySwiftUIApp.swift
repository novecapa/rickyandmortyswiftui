//
//  RickyAndMortySwiftUIApp.swift
//  RickyAndMortySwiftUI
//
//  Created by Josep Cerdà Penadés on 14/4/23.
//

import SwiftUI

@main
struct RickyAndMortySwiftUIApp: App {
    
    let appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            MainContentView()
        }
    }
    
    init() {
        appState.startApp()
    }
}
