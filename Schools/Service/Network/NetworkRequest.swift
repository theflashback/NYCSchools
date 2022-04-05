//  Copyright © 2022 Serge Klimoff. All rights reserved.

import Foundation

struct NetworkRequest {
    let endpoint: Endpoint
    let method: HTTPMethod
    let body: Data?
    
    init(endpoint: Endpoint, method: HTTPMethod) {
        self.endpoint = endpoint
        self.method = method
        self.body = nil
    }
    
    init<T: Encodable>(endpoint: Endpoint, method: HTTPMethod, parameters: T) {
        self.endpoint = endpoint
        self.method = method
        self.body = try! JSONEncoder().encode(parameters)
    }
    
    func urlRequest(baseURL: URL) -> URLRequest {
        let url = baseURL.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if let body = body {
            request.httpBody = body
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        return request
    }
}
