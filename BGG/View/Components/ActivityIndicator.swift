//
//  ActivityIndicator.swift
//  BGG
//
//  Created by Adam Trzcinski on 02/08/2019.
//  Copyright © 2019 Adam. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

#if DEBUG
struct ActivityIndicator_Previews : PreviewProvider {
    static var previews: some View {
        ActivityIndicator(isAnimating: .constant(true), style: .large)
    }
}
#endif
