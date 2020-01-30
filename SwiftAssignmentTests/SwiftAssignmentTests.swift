//
//  SwiftAssignmentTests.swift
//  SwiftAssignmentTests
//
//  Created by Dipendra Dubey on 21/01/20.
//  Copyright © 2020 Dipendra. All rights reserved.
//

import XCTest
@testable import SwiftAssignment


class SwiftAssignmentTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInfo() {
        let infoList1 = InfoList(title: nil, description: nil, imageHref: nil)
        let infoList2 = InfoList(title: "abc", description: "def", imageHref: nil)
        
        let arrInfoList = [infoList1, infoList2]
        var arrInfoModel = arrInfoList.map {return InfoModel($0)}
        arrInfoModel = arrInfoModel.filter({ (arrInfoModel) -> Bool in
            return arrInfoModel.name.count > 0
        })
        XCTAssert(arrInfoModel.count == 1, "Nil value shouldn't be considered")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
