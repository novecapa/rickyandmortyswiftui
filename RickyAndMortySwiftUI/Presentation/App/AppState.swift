//
//  AppState.swift
//  RickyAndMortySwiftUI
//
//  Created by Josep Cerdà Penadés on 18/4/23.
//

import Foundation


class AppState: ObservableObject {

    func startApp() {
        print("\(Utils.getDocumentsDirectory().relativePath)")
        RealmHelper.applyMigrations()
    }
}
