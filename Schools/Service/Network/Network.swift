//  Copyright © 2022 Serge Klimoff. All rights reserved.

import Foundation

final class Network {
    static let api = Network(environment: .demo)
    
    private let baseURL: URL
    private let session: URLSession
    
    private init(environment: NetworkEnvironment) {
        baseURL = environment.baseURL
        session = URLSession.shared
    }
    
    func load<T: Decodable>(_ request: NetworkRequest, completion: @escaping (Result<T, NetworkError>) -> Void) {
        session.dataTask(with: request.urlRequest(baseURL: baseURL)) {
            let result = self.parseResponse(model: T.self, data: $0, response: $1, error: $2)
            DispatchQueue.main.async {
                completion(result)
            }
        }
        .resume()
    }

     private func parseResponse<T: Decodable>(model: T.Type, data: Data?, response: URLResponse?, error: Error?) -> Result<T, NetworkError> {
        if let error = error {
            return .failure(.requestFailed(error.localizedDescription))
        }
        guard let data = data, let response = response as? HTTPURLResponse else {
            return .failure(.missingData)
        }
        guard response.statusCode < 400 else {
            return .failure(.errorStatus(response.statusCode))
        }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return .success(try decoder.decode(model, from: data))
        } catch let error {
            return .failure(.parsingError(error.localizedDescription))
        }
    }
}
