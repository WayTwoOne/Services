//
//  NetworkService.swift
//  Services
//
//  Created by Vladimir on 29.03.2024.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()

    private var cancellable: AnyCancellable?

    private init() {}

    func fetchData() -> AnyPublisher<[Service], Never> {
        guard let url = URL(string: API.servicesURL.rawValue) else {
            return  Just([Service]()).eraseToAnyPublisher()
            }
            return fetch(url)
            .map { (response: ServicseModel) -> [Service] in
                return response.body.services
                }
                .replaceError(with: [Service]())
                .eraseToAnyPublisher()
        }
    
    func fetchImage(from url: String?, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: url ?? "") else {
            completion(.failure(.invalidURL))
            return
        }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
    
    func fetch<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
                       URLSession.shared.dataTaskPublisher(for: url)
                        .map { $0.data}
                        .decode(type: T.self, decoder: JSONDecoder())
                        .receive(on: RunLoop.main)
                        .eraseToAnyPublisher()
        }
}

