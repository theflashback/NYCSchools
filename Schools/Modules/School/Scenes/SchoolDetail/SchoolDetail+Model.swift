//  Copyright © 2022 Serge Klimoff. All rights reserved.

import MapKit

extension SchoolDetail {
    struct Model {
        let school: School
        var sat: SAT?
        var alert: AlertModel?
        var isLoaded = false
        var mapCoordinate: CLLocationCoordinate2D?
    }
}
