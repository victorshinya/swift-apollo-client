//
//  CharacterRowView.swift
//  Swift Apollo Client
//
//  Created by Victor Shinya on 10/12/19.
//  Copyright © 2019 Victor Shinya. All rights reserved.
//

import SwiftUI

struct CharacterRowView: View {
    var character: CharacterQuery.Data.Character.Result
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center, spacing: CGFloat(16.0)) {
                Image(uiImage: UIImage(data: try! Data(contentsOf: URL(string: character.image)!))!)
                    .resizable()
                    .frame(width: 90.0, height: 90.0)
                VStack(alignment: .leading) {
                    Text(character.name)
                    Text(character.species)
                    Text(character.gender)
                    Text(character.status)
                }
                Spacer()
            }
        }
    }
}

struct CharacterRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CharacterRowView(character: characterData[0])
            CharacterRowView(character: characterData[1])
        }
        .previewLayout(.fixed(width: 300, height: 100))
    }
}
