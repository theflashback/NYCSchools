//  Copyright © 2022 Serge Klimoff. All rights reserved.

import Foundation

extension Result {
    @discardableResult
    func success(_ handler: (Success) -> Void) -> Result {
        if case let .success(response) = self {
            handler(response)
        }
        return self
    }

    @discardableResult
    func failure(_ handler: (Failure) -> Void) -> Result {
        if case let .failure(error) = self {
            handler(error)
        }
        return self
    }
}
