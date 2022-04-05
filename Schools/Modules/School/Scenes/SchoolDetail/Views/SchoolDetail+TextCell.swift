//  Copyright © 2022 Serge Klimoff. All rights reserved.

import SwiftUI

extension SchoolDetail {
    struct TextCell: View {
        let title: String
        let value: String
        
        var body: some View {
            HStack {
                Text(title)
                    .foregroundColor(.secondary)
                Spacer(minLength: 16)
                Text(value)
            }
            .font(.subheadline)
        }
    }
}

struct SchoolDetailTextCell_Previews: PreviewProvider {
    static var previews: some View {
        SchoolDetail.TextCell(title: "Score", value: "4000")
    }
}
