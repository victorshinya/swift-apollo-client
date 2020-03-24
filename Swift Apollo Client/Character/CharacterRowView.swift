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
                WebImage(url: (character.image ?? ""))
                    .frame(width: 90.0, height: 90.0)
                    .cornerRadius(16.0)
                VStack(alignment: .leading) {
                    Text(character.name ?? "")
                        .font(.system(size: 24.0))
                        .bold()
                    HStack {
                        Text(character.species ?? "")
                        Text("•")
                        Text(character.gender ?? "")
                        Text("•")
                        Text(character.status ?? "")
                    }
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
            CharacterRowView(character: characterData[2])
            CharacterRowView(character: characterData[3])
        }
        .previewLayout(.fixed(width: 375, height: 100))
    }
}
