//  Copyright © 2022 Serge Klimoff. All rights reserved.

import MapKit

extension SchoolDetail {
    final class ViewModel: ObservableObject {
        @Published var model: Model
        @Published var mapRegion = MKCoordinateRegion(.null)
        
        init(school: School) {
            model = Model(school: school)
        }
    }
}

extension SchoolDetail.ViewModel {
    func onAppear() {
        loadSat()
        loadMap()
    }
}

private extension SchoolDetail.ViewModel {
    func loadSat() {
        Network.api.sat(school: model.school) { result in
            result.success { sat in
                self.model.sat = sat
            }.failure { error in
                self.model.alert = AlertModel(title: error.title, message: error.description)
            }
            self.model.isLoaded = true
        }
    }
    
    func loadMap() {
        model.mapCoordinate = SchoolLocationParser().coordinates(from: model.school.location)
        if let coordinate = model.mapCoordinate {
            mapRegion = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        }
    }
}
