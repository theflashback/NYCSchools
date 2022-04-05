//  Copyright © 2022 Serge Klimoff. All rights reserved.

import SwiftUI

extension Alert {
    init(model: AlertModel) {
        self.init(
            title: Text(model.title),
            message: Text(model.message),
            dismissButton: .default(Text("OK"))
        )
    }
}

extension View {
    func alert(model: Binding<AlertModel?>) -> some View {
        alert(item: model, content: Alert.init)
    }
}

struct AlertModel: Identifiable {
    let id = UUID()
    let title: String
    let message: String
}
