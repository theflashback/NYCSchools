//  Copyright © 2022 Serge Klimoff. All rights reserved.

import SwiftUI

@main
struct SchoolsApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SchoolList()
            }
        }
    }
}
