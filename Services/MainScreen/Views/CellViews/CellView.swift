//
//  CellView.swift
//  Services
//
//  Created by Vladimir on 29.03.2024.
//

import SwiftUI

struct CellView: View {
    var service: Service
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
            Button {
                print("Buttom Action")
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

//struct CellView_Previews: PreviewProvider {
//    static var previews: some View {
//        CellView(imageLoader: ImageLoader)
//    }
//}

//if imageLoader.image != nil {
//    Image(uiImage: imageLoader.image!)
//        .resizable()
//        .frame(width: width * 0.1, height: height * 0.06)
//} else {
//    Image.default
//}
