//  Copyright © 2022 Serge Klimoff. All rights reserved.

import Foundation

enum NetworkEnvironment {
    case demo
    
    var baseURL: URL {
        switch self {
        case .demo: return URL(string: "https://data.cityofnewyork.us/")!
        }
    }
}
