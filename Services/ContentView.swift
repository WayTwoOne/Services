//
//  ContentView.swift
//  Services
//
//  Created by Vladimir on 29.03.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ServicesView()
        }
        .padding(.leading, -10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
