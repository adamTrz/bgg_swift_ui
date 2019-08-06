//
//  HotItems.swift
//  BGG
//
//  Created by Adam Trzcinski on 03/08/2019.
//  Copyright © 2019 Adam. All rights reserved.
//

import SwiftUI
import Combine

//enum GameType: CaseIterable, Identifiable {
//    case game
//    case people
//    case company
//}
//
//extension GameType {
//    var id: UUID {
//        return UUID()
//    }
//    var name: String {
//        switch self {
//        case .game:
//            return "Game"
//        case .company:
//            return "Company"
//        case .people:
//            return "People"
//        }
//    }
//}


struct HotItems : View {
    
    @State private var selectedType: HotItemType = .boardgame
    
    // TODO - This is ugly!
    @State var gameManager = HotItemsNetworkManager(kind: .boardgame)
    @State var companyManager = HotItemsNetworkManager(kind: .company)
    @State var peopleManager = HotItemsNetworkManager(kind: .people)
    
    
    var body: some View {
        // TODO - This is ugly too!
        let manager: HotItemsNetworkManager
        switch selectedType {
        case .boardgame:
            manager = gameManager
        case .company:
            manager = companyManager
        default:
            manager = peopleManager
        }
        return
            // List needs to be top level component in order for large header to animate....
            List {
                SegmentedControl(selection: $selectedType) {
                    ForEach(HotItemType.allCases) { type in
                        Text(type.name).tag(type)
                    }
                }
                if manager.loading {
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                }
                ForEach(manager.items .identified(by: \.id)) { item  in
                    HotItemRow(item: item)
                }
                }.navigationBarTitle(Text("Hot Items"))
        
    }
}

#if DEBUG
struct HotItems_Previews : PreviewProvider {
    static var previews: some View {
        HotItems()
    }
}
#endif

