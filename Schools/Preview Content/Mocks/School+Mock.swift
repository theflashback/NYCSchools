//  Copyright © 2022 Serge Klimoff. All rights reserved.

import Foundation

extension School {
    static var mock: School {
        School(
            dbn: "123",
            schoolName: "Test school",
            totalStudents: "321",
            overviewParagraph: "Description fo school goes here",
            neighborhood: "Somewhere in NYC",
            website: "www.nycschool.com",
            location: "10 East 15th Street, Manhattan NY 10003 (40.736526, -73.992727)"
        )
    }
    
    static var richmondHillHighSchool: School {
        School(
            dbn: "27Q475",
            schoolName: "Richmond Hill High School",
            totalStudents: "1950",
            overviewParagraph: "Richmond Hill High School",
            neighborhood: "Richmond Hill",
            website: "www.richmondhillhs.org",
            location: "89-30 114th Street, Richmond Hill NY 11418 (40.695171, -73.833815)"
        )
    }
}
