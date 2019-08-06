//
//  ImageViewWidget.swift
//  BGG
//
//  Created by Adam Trzcinski on 03/08/2019.
//  Copyright © 2019 Adam. All rights reserved.
//

import SwiftUI
import Combine

struct ImageViewWidget : View {
    @ObjectBinding var imageLoader: ImageLoader
    
    var size: Length
    
    init(imageUrl: String, size: Length? = 100) {
        imageLoader = ImageLoader(imageUrl)
        self.size = size ?? 100
    }
    
    var body: some View {
        VStack {
            Image(
                uiImage:
                UIImage(data: imageLoader.data)
                    ?? UIImage(named: "noImage")!
                ).renderingMode(.original)
                .resizable()
                .frame(width: size, height: size)
                .aspectRatio(1, contentMode: .fit)
            
            }.frame(width: size, height: size)
    }
}

#if DEBUG
struct ImageViewWidget_Previews : PreviewProvider {
    static var previews: some View {
        ImageViewWidget(
            imageUrl: "https://cf.geekdo-images.com/itemrep/img/CxKzEmfssf9Duxr9iKPg3PUb5zg=/fit-in/246x300/pic4848330.jpg", size: 344)
    }
}
#endif
