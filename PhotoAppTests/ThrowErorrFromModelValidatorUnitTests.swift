//
//  ThrowErorrFromModelValidatorUnitTests.swift
//  PhotoAppTests
//
//  Created by Ayodeji Ayankola on 15/03/2023.
//

import XCTest
@testable import PhotoApp

final class ThrowErorrFromModelValidatorUnitTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	
	func testThrowErorrFromModelValidator_WhenInvalidCharacterProvidedForMiddleName_ThrowsAnError() {
		// Arrange
		let sut = ThrowErorrFromModelValidator()
		
		//Act and Assert
		XCTAssertThrowsError(try sut.isMiddleNameValid(middleName: "Ayokunle!"), "The isMiddleNameValid should have thrown an error if user's middle name contains an invalid legal character") { (errorthown) in
			XCTAssertEqual(errorthown as? SignupError, SignupError.illegalCharactersFound)

		}
//
//		do {
//			let _ = try sut.isMiddleNameValid(middleName: "Ayokunle!")
//			XCTFail("The isMiddleNameValid should have thrown an error if user's middle name contains no invalid legal character ")
//		} catch  SignupError.illegalCharactersFound {
//			// succesfully passing
//
//			return
//		} catch {
//			XCTFail("The isMiddleNameValid should have thrown the signupError.illegalCharactersFound error when on invalid legal character were prolvided ")
//		}
		
	}

	
	func testThrowErorrFromModelValidator_WhenValidCharacterProvidedForMiddleName_ThrowsNoError() {
		// Arrange
		let sut = ThrowErorrFromModelValidator()
		
		//Act
		XCTAssertNoThrow(try sut.isMiddleNameValid(middleName: "Ayokunle"), "The isMiddleNameValid should throw no error if user's middle name contains an valid legal character")
		//Assert
//		do {
//			let _ = try sut.isMiddleNameValid(middleName: "Ayokunle")
//		} catch {
//			XCTFail("The isMiddleNameValid should throw no error if user's middle name contains an valid legal character")
//		}
//		
	}

}
