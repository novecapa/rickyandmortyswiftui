//
//  CharacterCell.swift
//  RickyAndMortySwiftUI
//
//  Created by Josep Cerdà Penadés on 18/4/23.
//

import Foundation
import SwiftUI

struct CharacterCell: View {
    
    let item: CharacterEntity
    
    var body: some View {
        HStack {
            if let url = URL(string: item.image) {
                AsyncImage(url: url) { image in
                    image.resizable()
//                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                } placeholder: {
                    ProgressView()
                        .frame(width: 20, height: 20)
                }.cornerRadius(30)
                .padding(.trailing, 10)
                Text(item.name)
                    .font(.headline)
                    .lineLimit(2)
                Spacer()
            }
        }
    }
}
