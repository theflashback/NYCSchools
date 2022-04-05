//  Copyright © 2022 Serge Klimoff. All rights reserved.

import MapKit

struct SchoolLocationParser {
    /// The locationString format is e.g. "10 East 15th Street, Manhattan NY 10003 (40.736526, -73.992727)" but we're only interested in
    /// latitude and longitude so we drop the last ")" bracket, drop everything before and including the last "(" bracket and get the coordinates
    /// by splitting the remaining string by separator ", " - if all went well we have two doubles
    func coordinates(from locationString: String) -> CLLocationCoordinate2D? {
        guard let coordinates = String(locationString.dropLast())
            .components(separatedBy: "(")
            .last?
            .components(separatedBy: ", ")
            .compactMap(Double.init), coordinates.count == 2
        else { return nil }
        return CLLocationCoordinate2D(latitude: coordinates[0], longitude: coordinates[1])
    }
}
