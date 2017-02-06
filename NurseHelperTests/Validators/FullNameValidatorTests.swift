//
//  FullNameValidatorTests.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 1/30/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

@testable import NurseHelper
import XCTest

class FullNameValidatorTests: XCTestCase {
    
    var validator:FullNameValidator!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        validator = FullNameValidator()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
 
    func testThatValidatorReturnsErrorForEmptyName() {
        let name = ""
        
        let result = validator.validate(string: name)
        
        XCTAssertTrue(result.convertErrorToBool())
    }
    
    func testThatValidatorReturnsErrorForExceedLongString() {
        let name = "isdiididsiosidosdiodsgsdgsdgsd2344msdn,mdgsnmsd,gdgns,ngs,dg,mg,mndsn,mgm,nds,mgsdgdsgdsgssdgdsgsdgdsgdsgdgsdgsdgdsgsddsgdsgdsgsdgsdgsdewww" //139 symbols
        
        let result = validator.validate(string: name)
        
        XCTAssertTrue(result.convertErrorToBool())
    }
    
    func testThatProperNameReturnsSuccess() {
        let name = "Fred Parker"
        
        let result = validator.validate(string: name)
        
        XCTAssertTrue(result.convertSuccessToBool())
    }
    
}
