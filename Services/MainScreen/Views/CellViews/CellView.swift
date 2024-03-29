//
//  CellView.swift
//  Services
//
//  Created by Vladimir on 29.03.2024.
//

import SwiftUI

struct CellView: View {
    @ObservedObject var viewModel: ServicesViewModel
    var service: Service
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
            Button {
                viewModel.deleteComp(with: service.link)
                viewModel.openSiteOrApplication(with: service.link)
            } label: {
                HStack(spacing: 10) {
                    AsyncImage(url: URL(string: service.iconURL)) { image in
                        image
                            .resizable()
                            .frame(width: width * 0.15, height: height * 0.08)
                    } placeholder: {
                        ProgressView()
                    }

                    VStack(alignment:.leading) {
                        Text(service.name)
                            .font(.title3)
                            .frame(width: width * 0.65, alignment: .leading)
                        Text(service.description)
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading)
                            .frame(width: width * 0.65, alignment: .leading)
                            
                    }
                    .frame(width: width * 0.65)
                    
                    Image(systemName: "chevron.forward")
                        .frame(width: 0.05, height: 0.05)
                        .foregroundColor(.gray)
                        .padding(.leading)
                }
            }
            .frame(width: width, height: height * 0.09)
    }
}
