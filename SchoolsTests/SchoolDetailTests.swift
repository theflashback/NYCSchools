//  Copyright © 2022 Serge Klimoff. All rights reserved.

import XCTest
import Combine
@testable import Schools

final class SchoolDetailTests: XCTestCase {
    private var cancellables = Set<AnyCancellable>()
    
    func testDataIsLoaded() {
        let viewModel = SchoolDetail.ViewModel(school: .richmondHillHighSchool)
        let expectation = XCTestExpectation(description: "Model's sat property is set")
        
        viewModel.$model
            .dropFirst()
            .sink { model in
                guard model.isLoaded else { return }
                XCTAssertNotNil(model.sat)
                XCTAssertNil(model.alert)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.onAppear()
 
        wait(for: [expectation], timeout: 5)
    }
}
