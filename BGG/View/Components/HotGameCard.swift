//
//  HotGame.swift
//  BGG
//
//  Created by Adam Trzcinski on 02/08/2019.
//  Copyright © 2019 Adam. All rights reserved.
//

import SwiftUI
import Combine

struct HotGameCard : View {
    
    var item: HotItem
    
    init(item: HotItem) {
        self.item = item
    }
    
    var body: some View {
        NavigationButton(destination: GameDetails()) {
            VStack {
                ImageViewWidget(imageUrl: item.thumbnail)
                Text(item.name)
                    .font(.footnote)
                    .fontWeight(.thin)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
                }
                .padding()
                .frame(width: 120.0, height: 120.0)
                .shadow(radius: 5)
        }
    }
}

#if DEBUG
struct HotGameCard_Previews : PreviewProvider {
    static var previews: some View {
        HotGameCard(item: HotItem(rank: "5", id: "239472", name: "Abomination: The Heir of Frankenstein", thumbnail: "https://cf.geekdo-images.com/thumb/img/dmBRyBYNTVkZ1r89l5P_oObculU=/fit-in/200x150/pic4875637.png", yearPublished: "2019"))
    }
}
#endif
