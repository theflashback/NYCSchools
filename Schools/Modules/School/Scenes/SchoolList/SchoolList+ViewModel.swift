//  Copyright © 2022 Serge Klimoff. All rights reserved.

import Foundation

extension SchoolList {
    final class ViewModel: ObservableObject {
        @Published var model = Model()
    }
}

extension SchoolList.ViewModel {
    func onAppear() {
        loadSchools()
    }
}

private extension SchoolList.ViewModel {
    func loadSchools() {
        // a pageable API would make sense here
        Network.api.schools { result in
            result.success { schools in
                self.model.schools = schools
            }.failure { error in
                self.model.alert = AlertModel(title: error.title, message: error.description)
            }
        }
    }
}
