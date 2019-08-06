//
//  ImageLoader.swift
//  BGG
//
//  Created by Adam Trzcinski on 03/08/2019.
//  Copyright © 2019 Adam. All rights reserved.
//

import SwiftUI
import Combine

class ImageLoader: BindableObject {
    
    var didChange = PassthroughSubject<Data, Never>()
    
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(_ imageUrl: String) {
        guard let url = URL(string: imageUrl) else {
            self.data = Data()
            return
//            fatalError("Error creating url...")
        }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            guard let data = data else {
                fatalError("Error fetching image data")
            }
            DispatchQueue.main.async {
                self.data = data
            }
            }.resume()
    }
}
