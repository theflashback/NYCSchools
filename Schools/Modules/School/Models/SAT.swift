//  Copyright © 2022 Serge Klimoff. All rights reserved.

import Foundation

struct SAT: Codable, Hashable {
    let dbn: String
    let testTakerCount: String
    let criticalReadingAverageScore: String
    let mathAverageScore: String
    let writingAverageScore: String
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case testTakerCount = "numOfSatTestTakers"
        case criticalReadingAverageScore = "satCriticalReadingAvgScore"
        case mathAverageScore = "satMathAvgScore"
        case writingAverageScore = "satWritingAvgScore"
    }
}

extension SAT: Identifiable {
    var id: String { dbn }
}
