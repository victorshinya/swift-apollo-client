//
//  ContentView.swift
//  Swift Apollo Client
//
//  Created by Victor Shinya on 09/12/19.
//  Copyright © 2019 Victor Shinya. All rights reserved.
//

import SwiftUI

struct CharacterListView: View {
    @State var characterData = [CharacterQuery.Data.Character.Result]()
    @State var page: Int = 1
    
    var body: some View {
        NavigationView {
            List(characterData) { character in
                CharacterRowView(character: character)
                .onAppear {
                    if character.id! == String(self.characterData.count - 1) {
                        self.page += 1
                        self.loadData()
                    }
                }
            }
            .navigationBarTitle(Text("Rick and Morty"))
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        Network.shared.apollo.fetch(query: CharacterQuery(page: page)) { result in
            switch result {
            case .success(let graphQLResult):
                if let results = graphQLResult.data?.characters?.results {
                    self.characterData.append(contentsOf: results.compactMap { $0 })
                }
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(characterData: characterData)
    }
}
