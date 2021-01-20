//
//  ImageLoader.swift
//  instagramClone
//
//  Created by Sinan Özman on 18.01.2021.
//

import Foundation
import SwiftUI

class ImageLoader: ObservableObject {
    
    var data = Data() {
        didSet {
            if let image = UIImage(data: data) {
                self.image = image
            }
        }
    }
    
    @Published var image = UIImage()
    @Published var status: Bool = true

    init (urlString: String) {
        status = false
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
                self.status = true
            }
        }
        task.resume()
    }
}
