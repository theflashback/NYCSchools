//  Copyright © 2022 Serge Klimoff. All rights reserved.

import Foundation

enum Endpoint {
    case schools
    case sat(String)
    
    var path: String {
        switch self {
        case .schools: return "resource/s3k6-pzi2.json"
        case .sat: return "resource/f9bf-2cp4.json"
        }
    }
}
