//
//  MedicineNameValidatorTests.swift
//  NurseHelper
//
//  Created by Vyacheslav Okulov on 1/30/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

@testable import NurseHelper
import XCTest

class MedicineNameValidatorTests: XCTestCase {
    
    var validator:MedicineNameValidator!
    
    override func setUp() {
        super.setUp()
        validator = MedicineNameValidator()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThatEmptyStringReturnsError() {
        let medicineName = ""
        let result = validator.validate(string: medicineName)
        XCTAssertTrue(result.convertErrorToBool())
    }
    
    func thatThatExceedingLongerStringReturnsError() {
        let longMedicineName = "ddgdsjglsgdlgkjsdkgljskldgklsdjgkldsjgkldsjgkljsdklgjdskljgkldsjglkdsjgkldsjgkldsjklgjdsklgjlksdjglksdjgklsdjglkdsjglkjsdlgkjdsklgjsdklgjdsklgjkdlsjglkdsjgkldsjglksjdglkjdslkgjkdsjgldsgkdjslgkjsdlkgjsdklgjlkdsjglkdsjlgkdjsklgjdslkgjdslgjsdlkjgldksjgkldsjlkgjsdlkgjlsdkjglkdsjglkdsjglksjdglkjsdlkgjskldjgkdskljgksdjgljsdlgkjsdkljgklsdjgljsdlkgjsdlkjgksdljgkdsjgklsdjglkjsdklgjdslkgjlksdjgjlkdsjglkjsdlkgjsdlkgjskdjglksdjlgkjdslgkjsdlkjgklsdjgkljsdlkg"
        let result = validator.validate(string: longMedicineName)
        XCTAssertTrue(result.convertErrorToBool())
    }
    
    func testThatNormalNameReturnSuccess() {
        let normalName = "Nurofen"
        
        let result = validator.validate(string: normalName)
        
        XCTAssertTrue(result.convertSuccessToBool())
    }
    
}
