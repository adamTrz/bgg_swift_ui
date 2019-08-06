//
//  ContentView.swift
//  BGG
//
//  Created by Adam Trzcinski on 02/08/2019.
//  Copyright © 2019 Adam. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView : View {
    var body: some View {
        NavigationView {
            List {
                HotSection()
                Section(header: Text("Announcements")) {
                    Text("Hotnes")
                }
                Section(header: Text("Sponsored Contests")) {
                    Text("Sponsored Contests")
                }
                Section(header: Text("Gone Cardboard")) {
                    Text("Gone Cardboard")
                }
                Section(header: NavigationButton(destination: HotItems(), isDetail: false) {
                    Text("GeekLists")
                }) {
                    Text("GeekLists")
                }
                }.navigationBarTitle(Text("Home"))
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

