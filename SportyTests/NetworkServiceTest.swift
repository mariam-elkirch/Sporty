//
//  NetworkServiceTest.swift
//  SportyTests
//
//  Created by user188930 on 5/22/22.
//  Copyright © 2022 iti. All rights reserved.
//

import XCTest
@testable import Sporty
class NetworkServiceTest: XCTestCase {
     let networkManager : NetworkServiceProtocol = NetworkServic()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testEventsResult(){
        let myExpection = expectation(description:"wait of api");
        networkManager.eventsResult(myidLeague: "4617") {
           (myevents,error) in
            guard let events = myevents else{
                XCTFail()
                return
            }
            XCTAssertEqual(events.events.count, 100)
            myExpection.fulfill()
            
        }
        waitForExpectations(timeout: 15, handler: nil)
    
    }
    
  func testSportsResult(){
         let myExpection = expectation(description:"wait of api");
    networkManager.sportResult() {
            (sports) in
             guard let mysports = sports else{
                 XCTFail()
                 return
             }
        XCTAssertEqual(mysports.sports?.count, 34)
             myExpection.fulfill()
             
         }
         waitForExpectations(timeout: 15, handler: nil)
     
     }
}
