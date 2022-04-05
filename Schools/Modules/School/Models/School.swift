//  Copyright © 2022 Serge Klimoff. All rights reserved.

import Foundation

struct School: Codable, Hashable {
    let dbn: String
    let schoolName: String
    let totalStudents: String
    let overviewParagraph: String
    let neighborhood: String
    let website: String
    let location: String
}

extension School: Identifiable {
    var id: String { dbn }
}
