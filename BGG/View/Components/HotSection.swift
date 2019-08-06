//
//  HotSection.swift
//  BGG
//
//  Created by Adam Trzcinski on 03/08/2019.
//  Copyright © 2019 Adam. All rights reserved.
//
import SwiftUI
import Combine


let url = "https://www.boardgamegeek.com/xmlapi2/hot?type=boardgame"

struct HotSection : View {
    
    @State var networkManager = HotItemsNetworkManager(kind: .boardgame, count: 7)
    
    var body: some View {
        return Section(header:
            NavigationButton(destination: HotItems() ) {
                Text("The Hotness")
            }
        ) {
            ZStack {
                if networkManager.items.count > 0 {
                    ScrollView(showsHorizontalIndicator: false) {
                        HStack {
                            ForEach(networkManager.items.identified(by: \.id)) { item in
                                HotGameCard(item: item)
                            }
                        }
                    }
                }
                if networkManager.loading {
                    HStack {
                        Spacer()
                        ActivityIndicator(isAnimating: .constant(true), style: .large)
                        Spacer()
                    }
                }
                }.frame(height: 120).padding(0)
        }
    }
}

#if DEBUG
struct HotSection_Previews : PreviewProvider {
    static var previews: some View {
        HotSection()
    }
}
#endif
