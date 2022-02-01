//
//  codeChallengeTests.swift
//  codeChallengeTests
//
//  Created by Sabih Tahir on 01/02/2022.
//  Copyright © 2022 Fernando Suárez. All rights reserved.
//

import XCTest
@testable import codeChallenge

class codeChallengeTests: XCTestCase {
    var sut: FlickrListHeader!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let nibArray = Bundle.main.loadNibNamed("FlickrListHeader", owner: nil, options: nil)
        sut = nibArray?.last as? FlickrListHeader
            
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testDateSorted() {
      // given
      let segmentedControl = UISegmentedControl()

      // when
        XCTAssertEqual(0,0,"date is acescending")
      segmentedControl.addTarget(
        sut,
        action: #selector(sut.clickDateToggle(_:)),
        for: .valueChanged)
      segmentedControl.sendActions(for: .valueChanged)

      // then
      XCTAssertEqual(1,1,"date is decending")

    }

}
