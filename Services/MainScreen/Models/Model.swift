//
//  Model.swift
//  Services
//
//  Created by Vladimir on 29.03.2024.
//

import Foundation

// MARK: - ServicseModel
struct ServicseModel: Codable {
    let body: Services
    let status: Int
}

// MARK: - Services
struct Services: Codable {
    let services: [Service]
}

// MARK: - Service
struct Service: Codable, Equatable {
    let name, description: String
    let link: String
    let iconURL: String

    enum CodingKeys: String, CodingKey {
        case name, description, link
        case iconURL = "icon_url"
    }
}
