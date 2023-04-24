//
//  MainContentView.swift
//  RickyAndMortySwiftUI
//
//  Created by Josep Cerdà Penadés on 14/4/23.
//

import SwiftUI

struct MainContentView: View {

    @StateObject var viewModel = MainViewModel()

    var body: some View {
        VStack {
//            List(0..<viewModel.charactersList.count, id: \.self) { index in
//                CharacterCell(item: self.viewModel.charactersList[index]).onAppear {
//                    if (index == viewModel.charactersList.count - 1) {
//                        print("last element")
//                    }
//                }
//            }
            MainHeaderView(titleView: "Hola").padding(12)
            Button("dd") {
                print("ddddddffwefwef")
            }
            List(viewModel.charactersList) { item in
                CharacterCell(item: item)
            }.listRowSeparator(.hidden)
        }
        .onAppear {
            viewModel.fetchCharacters()
        }
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
