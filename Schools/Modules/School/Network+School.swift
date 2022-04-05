//  Copyright © 2022 Serge Klimoff. All rights reserved.

import Foundation

extension Network {
    func schools(completion: @escaping (Result<[School], NetworkError>) -> Void) {
        load(NetworkRequest(endpoint: .schools, method: .get), completion: completion)
    }
    
    func sat(school: School, completion: @escaping (Result<SAT, NetworkError>) -> Void) {
        // this endpoint should be returning a single SAT value for a given school instead of filtering on the client
        load(NetworkRequest(endpoint: .sat(school.dbn), method: .get)) { (result: Result<[SAT], NetworkError>) in
            result.success { sats in
                guard let sat = sats.first(where: { $0.dbn == school.dbn }) else {
                    return completion(.failure(.missingSat))
                }
                completion(.success(sat))
            }.failure { error in
                completion(.failure(error))
            }
        }
    }
}
