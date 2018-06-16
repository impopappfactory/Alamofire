//
//  DispatchQueueSchedulerTests.swift
//  Alamofire
//
//  Created by Ivan Misuno on 17-06-2018.
//  Copyright © 2018 Alamofire. All rights reserved.
//

@testable import Alamofire
import Foundation
import XCTest

class DispatchQueueSchedulerTestCase: BaseTestCase {
    func testDispatchQueueScheduler_main_deliversOnMain() {
        let scheduler = DispatchQueueScheduler(queue: DispatchQueue.main)
        let expectation = self.expectation(description: "Delivered")

        scheduler.schedule {
            XCTAssertTrue(Thread.isMainThread)
            expectation.fulfill()
        }

        waitForExpectations(timeout: timeout, handler: nil)
    }

    func testDispatchQueueScheduler_background_deliversNotOnMain() {
        let scheduler = DispatchQueueScheduler(queue: DispatchQueue.utility)
        let expectation = self.expectation(description: "Delivered")

        scheduler.schedule {
            XCTAssertFalse(Thread.isMainThread)
            expectation.fulfill()
        }

        waitForExpectations(timeout: timeout, handler: nil)
    }
}
