//  Copyright © 2022 Serge Klimoff. All rights reserved.

import XCTest
import Combine
@testable import Schools

final class SchoolListTests: XCTestCase {
    private var cancellables = Set<AnyCancellable>()
    
    func testDataIsLoaded() {
        let viewModel = SchoolList.ViewModel()
        let expectation = XCTestExpectation(description: "Model's schools property is set")
        
        viewModel.$model
            .dropFirst()
            .sink { model in
                XCTAssertFalse(model.schools.isEmpty)
                XCTAssertNil(model.alert)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.onAppear()
 
        wait(for: [expectation], timeout: 5)
    }
}
