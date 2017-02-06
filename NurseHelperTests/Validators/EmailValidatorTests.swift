//
//  EmailValidatorTests.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 1/30/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

@testable import NurseHelper
import XCTest

class EmailValidatorTests: XCTestCase {
  
    var validator:EmailValidator!
  
    override func setUp() {
        super.setUp()
        validator = EmailValidator()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThatValidatorReturnsErrorForInproperEmail() {
        let email = "inpoper email"
        let result = validator.validate(string: email)
    
        XCTAssert(result.convertErrorToBool())
    }
    
    func testThatValidatorReturnsProperResultForCorrectEmail() {
        let email = "proper@mail.com"
        let result = validator.validate(string: email)
        XCTAssertTrue(result.convertSuccessToBool())
    }
    
    func testThatValidatorReturnsErrorForEmptyString() {
        let email = ""
        let result = validator.validate(string: email)
 
        XCTAssertTrue(result.convertErrorToBool())
    }
    
    func testThatValidatorReturnsErrorForVeryLongEmail() {
        let email = "ddgdsjglsgdlgkjsdkgljskldgklsdjgkldsjgkldsjgkljsdklgjdskljgkldsjglkdsjgkldsjgkldsjklgjdsklgjlksdjglksdjgklsdjglkdsjglkjsdlgkjdsklgjsdklgjdsklgjkdlsjglkdsjgkldsjglksjdglkjdslkgjkdsjgldsgkdjslgkjsdlkgjsdklgjlkdsjglkdsjlgkdjsklgjdslkgjdslgjsdlkjgldksjgkldsjlkgjsdlkgjlsdkjglkdsjglkdsjglksjdglkjsdlkgjskldjgkdskljgksdjgljsdlgkjsdkljgklsdjgljsdlkgjsdlkjgksdljgkdsjgklsdjglkjsdklgjdslkgjlksdjgjlkdsjglkjsdlkgjsdlkgjskdjglksdjlgkjdslgkjsdlkjgklsdjgkljsdlkg@mail.com"
        let result = validator.validate(string: email)
        
        XCTAssertTrue(result.convertErrorToBool())
        
    }
    
    func testThatValidatorReturnsSuccessForProperEmailThatContainsMaximumSymbols() {
        let email = "djgskldjgklsjdgkljdskgldsjkgjskldjgksldjglksjdgkljdsklgjdskgjdlskjgldksjglsdjgklsdjgklsjdklgjskdlgdsgkjdskljgklsdjgkdsjglkjdskgjdsklgjlksdjgklsdjgklsdjkgljsdklgjsdgsdlkgjsdlkgjsklgdjlsdgjksdglkjsdlkgjsdlkgldsdgsdgsdewqqqwqwqreeeeeewrqwrqrqwgsgsk@mail.com" // 254 symbols
        
        let result = validator.validate(string: email)
        
        XCTAssertTrue(result.convertSuccessToBool())
    }
    
  }

