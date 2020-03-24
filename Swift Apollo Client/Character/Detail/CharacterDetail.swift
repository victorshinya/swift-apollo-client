//
//  CharacterDetail.swift
//  Swift Apollo Client
//
//  Created by Victor Shinya on 12/12/19.
//  Copyright © 2019 Victor Shinya. All rights reserved.
//

import SwiftUI

struct CharacterDetail: View {
    let characterData: CharacterQuery.Data.Character.Result
    var body: some View {
        VStack {
            WebImage(url: characterData.image ?? "")
                .frame(width: 300, height: 300)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .offset(y: -160)
                .padding(.bottom, -160)
            VStack(alignment: .leading, spacing: 8.0) {
                Text(characterData.name ?? "")
                    .font(.system(size: 24.0))
                    .bold()
                HStack {
                    Text("Specie:")
                    Text(characterData.species ?? "")
                }
                HStack {
                    Text("Gender:")
                    Text(characterData.gender ?? "")
                }
                HStack {
                    Text("Status:")
                    Text(characterData.status ?? "")
                }
                HStack {
                    Text("Origin:")
                    Text(characterData.origin?.name ?? "")
                }
                HStack {
                    Text("Last location:")
                    Text(characterData.location?.name ?? "")
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    }
}

struct CharacterDetail_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetail(characterData: characterData[0])
    }
}

