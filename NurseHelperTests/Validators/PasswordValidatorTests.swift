//
//  PasswordValidatorTests.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 1/30/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

@testable import NurseHelper
import XCTest

class PasswordValidatorTests: XCTestCase {
    
    var validator:PasswordValidator!
    
    override func setUp() {
        super.setUp()
        validator = PasswordValidator()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThatEmptyPasswordReturnsError() {
        let password = ""
        let result = validator.validate(string: password)
        
        XCTAssertTrue(result.convertErrorToBool())
    }
    
    func testThatPasswordMoreThanMaximumLengthReturnsError() {
        let password = "isdiididsiosidosdiodsgsdgsdgsd2344" //34 symbols
        
        let result = validator.validate(string: password)
        
        XCTAssertTrue(result.convertErrorToBool())
    }
    
    func testThatMidSizePasswordReturnsSuccess() {
        let password = "123456788910124124"
        
        let result = validator.validate(string: password)
        
        XCTAssertTrue(result.convertSuccessToBool())
    }
    
    func testThatEdgeSizePasswordReturnsSuccess() {
        let password = "isdiididsiosidosdiodsgsdgsdgsd23" //32 symbols
        
        let result = validator.validate(string: password)
        
        XCTAssertTrue(result.convertSuccessToBool())
    }
    
}
