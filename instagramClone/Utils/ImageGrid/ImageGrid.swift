//
//  ImageGrid.swift
//  instagramClone
//
//  Created by Sinan Özman on 20.01.2021.
//

import SwiftUI
import Combine

struct ImageGrid: View {
    var images: [String] = []
    var rowCount: Int = 0
    
    init(images: [String]) {
        self.images = images
        self.rowCount = self.images.count / 2
    }
    var body: some View {
        VStack {
            ForEach(0..<rowCount, id: \.self) { index in
                HStack {
                    ImageView(withURL: self.images[index])
                    ImageView(withURL: self.images[index + 1])
                }
            }
        }
    }
}

//struct ImageGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageGrid()
//    }
//}
