//
//  NetworkService.swift
//  Black-Market
//
//  Created by Junior Sancho on 8/2/23.
//

import Foundation
import Combine

class NetworkService {
    func getData(from endpoint: NetworkEndpoint) -> AnyPublisher<Data, Error> {
        guard let request = buildRequest(from: endpoint) else {
            let error = NetworkError.network(description: "Couldn't create URLRequest")
            return Fail(error: error)
                .eraseToAnyPublisher()
        }
        
        return loadData(with: request)
            .eraseToAnyPublisher()
    }
    
    private func buildRequest(from endpoint: NetworkEndpoint) -> URLRequest? {
        guard var urlComponents = URLComponents(string: endpoint.absoluteURLString) else {
            return nil
        }
        if endpoint.httpMethod == .get {
            urlComponents.queryItems = endpoint.params.compactMap({ param -> URLQueryItem in
                return URLQueryItem(name: param.key, value: "\(param.value)")
            })
        }
        guard let url = urlComponents.url else {
            return nil
        }
        var urlRequest = URLRequest(
            url: url,
            cachePolicy: .reloadIgnoringLocalCacheData,
            timeoutInterval: 30
        )
        urlRequest.httpMethod = endpoint.httpMethod.rawValue
        if endpoint.httpMethod == .post {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: endpoint.params, options: [])
        }
        endpoint.headers.forEach {
            urlRequest.setValue($0.value, forHTTPHeaderField: $0.key)
        }
        return urlRequest
    }
    
    private func loadData(with request: URLRequest) -> AnyPublisher<Data, Error> {
        URLSession.shared.dataTaskPublisher(for: request)
            .mapError({ error -> Error in
                NetworkError.network(description: error.localizedDescription)
            })
            .map { $0.data }
            .eraseToAnyPublisher()
    }
}
