//
//  HotItemRow.swift
//  BGG
//
//  Created by Adam Trzcinski on 06/08/2019.
//  Copyright © 2019 Adam. All rights reserved.
//

import SwiftUI

struct HotItemRow : View {

    var item: HotItem
    
    var body: some View {
        return HStack {
            ImageViewWidget(imageUrl: item.thumbnail, size: 60)
            Text(item.name)
        }
    }
}

#if DEBUG
struct HotItemRow_Previews : PreviewProvider {
    static var previews: some View {
        HotItemRow(item: HotItem(rank: "5", id: "239472", name: "Abomination: The Heir of Frankenstein", thumbnail: "https://cf.geekdo-images.com/thumb/img/dmBRyBYNTVkZ1r89l5P_oObculU=/fit-in/200x150/pic4875637.png", yearPublished: "2019"))
    }
}
#endif
