//
//  HotItemsNetworkManager.swift
//  BGG
//
//  Created by Adam Trzcinski on 03/08/2019.
//  Copyright © 2019 Adam. All rights reserved.
//

import SwiftUI
import Combine
import Alamofire
import SWXMLHash

class HotItemsNetworkManager: BindableObject {

    var didChange = PassthroughSubject<HotItemsNetworkManager, Never>()

    var loading = true {
        didSet {
            didChange.send(self)
        }
    }

    var items = [HotItem]() {
        didSet {
            didChange.send(self)
        }
    }

    var error: Error? = nil {
        didSet {
            didChange.send(self)
        }
    }
    
    init(kind: HotItemType, count: Int? = 100) {
        guard let requestUrl = URL(string: kind.url) else { return }
        AF.request(requestUrl).response { (dataResponse) in
            do {
                let xml = SWXMLHash.parse(dataResponse.data!)
                let items: [HotItem] = try xml["items"]["item"]
                    .filterAll({ (_, index) -> Bool in
                        index < count ?? 100
                    })
                    .value()
                self.items = items
            } catch   {
                self.error = error
                print("Error: \(error)")
            }
            self.loading = false
        }
    }
}
