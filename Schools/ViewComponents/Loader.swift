//  Copyright © 2022 Serge Klimoff. All rights reserved.

import SwiftUI

struct Loader: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<Loader>) -> UIActivityIndicatorView {
        UIActivityIndicatorView(style: .large)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Loader>) {
        uiView.startAnimating()
    }
}
