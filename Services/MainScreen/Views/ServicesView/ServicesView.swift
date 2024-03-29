//
//  ServicesView.swift
//  Services
//
//  Created by Vladimir on 29.03.2024.
//

import SwiftUI

struct ServicesView: View {
    @StateObject var viewModel = ServicesViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel.services, id: \.name) { item in
                    CellView(service: item)
                }
                .navigationBarTitle("Сервисы", displayMode: .inline)
            }
            .frame(width: UIScreen.main.bounds.width)
            .foregroundColor(.white)
        }
    }
}

//struct ServicesView_Previews: PreviewProvider {
//    static var viewModel = ServicesViewModel()
//    static var previews: some View {
//        ServicesView(imageLoader: ImageLoader(url: viewModel))
//    }
//}
