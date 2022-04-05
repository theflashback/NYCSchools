//  Copyright © 2022 Serge Klimoff. All rights reserved.

import SwiftUI

struct SchoolList: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        Form {
            Section {
                ForEach(viewModel.model.schools, content: school)
            }
        }
        .overlay(loader)
        .alert(model: $viewModel.model.alert)
        .navigationBarTitle("NYC Schools")
        .onAppear(perform: viewModel.onAppear)
    }
    
    private func school(for school: School) -> some View {
        NavigationLink(destination: SchoolDetail(school: school)) {
            VStack(alignment: .leading, spacing: 2) {
                Text(school.schoolName)
                    .font(.subheadline)
                Text(school.neighborhood)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 4)
        }
    }
    
    @ViewBuilder
    private var loader: some View {
        if viewModel.model.schools.isEmpty {
            Loader()
        }
    }
}

struct SchoolList_Previews: PreviewProvider {
    static var previews: some View {
        SchoolList()
    }
}
