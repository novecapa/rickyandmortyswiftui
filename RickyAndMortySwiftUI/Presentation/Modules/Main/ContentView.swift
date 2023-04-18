//
//  ContentView.swift
//  RickyAndMortySwiftUI
//
//  Created by Josep Cerdà Penadés on 14/4/23.
//

import SwiftUI

struct ContentView: View {
    
//    @StateObject var networkClient = CharacterNetworkClient()
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        VStack {
            List(viewModel.charactersList, id: \.id) { item in
                Text(item.name)
            }
        }
        .onAppear {
            viewModel.fetchCharacters()
            print("\(Utils.getDocumentsDirectory().relativePath)")
            RealmHelper.applyMigrations()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
