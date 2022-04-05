//  Copyright © 2022 Serge Klimoff. All rights reserved.

import Foundation

enum NetworkError: Error {
    case requestFailed(String)
    case missingData
    case errorStatus(Int)
    case parsingError(String)
    case missingSat
    
    var title: String {
        switch self {
        case .requestFailed: return "Request Failed"
        case .missingData: return "Missing Data"
        case .errorStatus: return "HTTP Error Status"
        case .parsingError: return "Parsing Error"
        case .missingSat: return "Incomplete school data"
        }
    }
    
    var description: String {
        switch self {
        case let .requestFailed(message): return message
        case .missingData: return "Something went wrong"
        case let .errorStatus(status): return "Error code: \(status)"
        case let .parsingError(message): return message
        case .missingSat: return "School does not seem to have SAT data on file"
        }
    }
}
