//
//  HotItem.swift
//  BGG
//
//  Created by Adam Trzcinski on 02/08/2019.
//  Copyright © 2019 Adam. All rights reserved.
//
import SwiftUI
import Combine
import SWXMLHash

private let base_url = "https://www.boardgamegeek.com/xmlapi2/hot?type="

enum HotItemType: CaseIterable, Identifiable {
    case boardgame
    case people
    case company
}

extension HotItemType {
    var id: UUID {
        return UUID()
    }
    var name: String {
        switch self {
        case .boardgame:
            return "Game"
        case .company:
            return "Company"
        case .people:
            return "People"
        }
    }
    var url: String {
        switch self {
        case .boardgame:
            return "\(base_url)boardgame"
        case .company:
            return "\(base_url)boardgamecompany"
        default:
            return "\(base_url)boardgameperson"
        }
    }
    
}


struct HotItem: XMLIndexerDeserializable {
    var rank: String
    var id: String
    var name: String
    var thumbnail: String
    var yearPublished: String?
    
    static func deserialize(_ node: XMLIndexer) throws -> HotItem {
        print("egrergegerg \(node)")
        return try HotItem(
            rank: node.value(ofAttribute: "rank"),
            id: node.value(ofAttribute: "id"),
            name: node["name"].value(ofAttribute: "value"),
            thumbnail: node["thumbnail"].value(ofAttribute: "value"),
            yearPublished: node["yearpublished"].value(ofAttribute: "value")
        )
    }
    
}
