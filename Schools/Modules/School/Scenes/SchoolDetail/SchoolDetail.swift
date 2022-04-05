//  Copyright © 2022 Serge Klimoff. All rights reserved.

import SwiftUI
import MapKit

struct SchoolDetail: View {
    @StateObject private var viewModel: ViewModel
    
    var body: some View {
        Form {
            if viewModel.model.isLoaded {
                overviewSection
                satSection
                mapSection
            }
        }
        .overlay(loader)
        .alert(model: $viewModel.model.alert)
        .navigationBarTitle("SATs")
        .onAppear(perform: viewModel.onAppear)
    }
    
    private var overviewSection: some View {
        Section {
            TextCell(title: "School", value: viewModel.model.school.schoolName)
            overviewParagraph
            TextCell(title: "Number of students", value: viewModel.model.school.totalStudents)
            website
        }
    }
    
    private var overviewParagraph: some View {
        Text(viewModel.model.school.overviewParagraph)
            .font(.subheadline)
            .foregroundColor(.secondary)
            .padding(.vertical, 4)
    }
    
    @ViewBuilder
    private var website: some View {
        if let url = URL(string: "http://\(viewModel.model.school.website)") {
            Link(destination: url) {
                Text(viewModel.model.school.website)
                    .font(.footnote)
            }
        }
    }
    
    @ViewBuilder
    private var satSection: some View {
        if let sat = viewModel.model.sat {
            Section {
                TextCell(title: "Number of test takers", value: sat.testTakerCount)
                TextCell(title: "Average critical reading score", value: sat.criticalReadingAverageScore)
                TextCell(title: "Average math score", value: sat.mathAverageScore)
                TextCell(title: "Average writing score", value: sat.writingAverageScore)
            }
        }
    }
    
    @ViewBuilder
    private var mapSection: some View {
        if let coordinate = viewModel.model.mapCoordinate {
            Section {
                VStack(alignment: .leading) {
                    locationLabel
                    Map(coordinateRegion: $viewModel.mapRegion, annotationItems: [viewModel.model.school]) { item in
                        MapPin(coordinate: coordinate)
                    }
                    .frame(height: 200)
                }
                .padding(.vertical, 4)
            }
        }
    }
    
    private var locationLabel: some View {
        HStack(alignment: .top, spacing: 4) {
            Text("Location: ")
                .foregroundColor(.secondary)
            Text(viewModel.model.school.location)
                .foregroundColor(.primary)
        }
        .fixedSize(horizontal: false, vertical: true)
        .font(.subheadline)
    }
    
    @ViewBuilder
    private var loader: some View {
        if !viewModel.model.isLoaded {
            Loader()
        }
    }
}

extension SchoolDetail {
    init(school: School) {
        self.init(viewModel: ViewModel(school: school))
    }
}

struct SchoolDetail_Previews: PreviewProvider {
    static var previews: some View {
        SchoolDetail(school: .mock)
    }
}
