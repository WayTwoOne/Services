//
//  ServicesViewModel.swift
//  Services
//
//  Created by Vladimir on 29.03.2024.
//

import Foundation
import Combine
import SwiftUI

class ServicesViewModel: ObservableObject {
    
    @Published var services = [Service]()
    @Published var appName = ""
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        NetworkManager.shared.fetchData()
        
            .assign(to: \.services, on: self)
            .store(in: &self.cancellableSet)
    }
    
    func openSiteOrApplication(with string: String) {
           let appScheme = "\(appName)://app"
        guard let appUrl = URL(string: appScheme) else { return }

           if UIApplication.shared.canOpenURL(appUrl as URL) {
               UIApplication.shared.open(appUrl)
           } else {
               guard let url = URL(string: string) else { return }
               UIApplication.shared.open(url)
           }
    }
    
    func deleteComp(with string: String) {
        appName = ""
        var pointers = ""
        
        if let componenets = URL(string: string) {
            if let host = componenets.host() {
                for character in host {
                    if character == "." && pointers != "." {
                        pointers.append(character)
                        appName.append(character)
                    } else if (pointers == "." || pointers == "..") && character == "r" {
                        appName.removeLast()
                        return
                    } else if (pointers == "." || pointers == "..") && character == "c" {
                        appName.removeLast()
                        return
                    } else if pointers == ".." && character == "." {
                        pointers.removeLast()
                    } else {
                        appName.append(character)
                    }
                }
            }
        }
    }
}
