//
//  WebImage.swift
//  Swift Apollo Client
//
//  Created by Victor Shinya on 11/12/19.
//  Copyright © 2019 Victor Shinya. All rights reserved.
//

import SwiftUI
import Combine

struct WebImage: View {
    
    @ObservedObject private var downloadImage: DownloadImage
    
    init(url: String) {
        self.downloadImage = DownloadImage(from: url)
    }
    
    var image: UIImage? {
        downloadImage.data.flatMap(UIImage.init)
    }
    
    var body: some View {
        Image(uiImage: image ?? UIImage(imageLiteralResourceName: "ImagePlaceholder"))
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

class DownloadImage: ObservableObject {
    
    @Published var data: Data? = nil
    
    init(from imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}
