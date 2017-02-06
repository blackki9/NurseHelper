//
//  PhoneNumberValidatorTests.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 1/31/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

@testable import NurseHelper
import XCTest

class PhoneNumberValidatorTests: XCTestCase {
  
  var validator:PhoneNumberValidator!
  
  override func setUp() {
    super.setUp()
    validator = PhoneNumberValidator()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testThatValidatorReturnsErrorForEmptyString() {
    let number = ""
    let result = validator.validate(string:number)
    
    XCTAssertTrue(result.convertErrorToBool())
  }
  
  func testThatValidatorReturnsErrorForStringWithLengthMoreThanLimit() {
    let number = "gk;sdglkdslgkjdslkgjdlskglkdsglkdsjgksdjdsjkgjlskdgkdskgjdslkgjsdklgjlksdgjlsdjgklsdgsd"
    let result = validator.validate(string: number)
    
    XCTAssertTrue(result.convertErrorToBool())
  }
  
  func testThatValidatorReturnsSuccessForNormalString() {
    let number = "12345676776"
    
    let result = validator.validate(string: number)
    
    XCTAssertTrue(result.convertSuccessToBool())
  }
  
  
}
