//
//  SearchResultControllerTests.swift
//  iTunes SearchTests
//
//  Created by Ivan Caldwell on 2/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import iTunes_Search


class MockDataLoader: NetworkDataLoader {
    var request: URLRequest?
    var data: Data?
    var error: Error?
    
    func loadData (with request: URLRequest, completion: @escaping(Data?, Error?) -> Void {
        self.request = request
        DispatchQueue.main.async {
        completion(self.data, self.error)
        }
    }
}
class SearchResultControllerTests: XCTestCase {
    
    /**
     What shall we test?
     
     - Does decoding work when given good data
     - Does decoding fail when given bad data
     - Does it build the correct URLRequest?
     - Are results correctly saved into the property
     - Is the completion handler called if the networking fails
     - Is the completion handler called if the data is bad
     - Is the completion handler called if the data is good
     
     **/
    
    func testForSomeResults() {
        let mock = MockDataLoader()
        
        //let src = SearchResultController()
        
        let expect = expectation(description: "Wait for results")
        src.performSearch(for: "Elevate", resultType: .software) {
            // XCTFail()
            // ^^This cause every test to fail... I think^^
            expect.fulfill()
        }
        wait(for: [expect], timeout: 2)
        XCTAssertTrue(src.searchResults.count > 0, "Expecting at least 1 result when searching for 'Elevate'")
    }
    
    func testDecodingFailsForBadData() {
        
    }
    
    func testForNoResults() {
        
    }
    
    func testCorrectlyConstructedURLRequest() {
        
    }
    
    func testResultsSavedInToProperty() {
        
    }
    
    func testCompletionForFailedNetworking() {
        
    }
    
    func testCompletionForBadData() {
        
    }
    
    func testCompletionForGoodData() {
        
    }
    
}
