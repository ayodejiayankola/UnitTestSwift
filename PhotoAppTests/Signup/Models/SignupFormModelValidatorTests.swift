//
//  SignupFormModelValidatorTests.swift
//  PhotoAppTests
//
//  Created by Ayodeji Ayankola on 06/02/2023.
//

import XCTest
@testable import PhotoApp

final class SignupFormModelValidatorTests: XCTestCase {
	
	var sut: SignupFormModelValidator!
	override func setUpWithError() throws {
		// Put setup code here. This method is called before the invocation of each test method in the class.
		sut = SignupFormModelValidator()
	}
	
	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		sut = nil
	}
	
	func testSignupFormModelValidator_WhenUserFirstNameIsProvided_ShouldReturnTrue() {
		
		// Arrange
		//		let sut = SignupFormModelValidator()
		
		// Act
		let isFirstNamevalid = sut.isFirstNameValid(firstName: "Ayodeji")
		
		// Assert
		XCTAssertTrue(isFirstNamevalid, "The isFirstNameValid() should have return TRUE for a valid first name  but returned false")
		
	}
	
	func testSignupFormModelValidator_WhenUserFirstNameIsTooShort_ShouldReturnFalse(){
		
		// Arrange
		//		let sut = SignupFormModelValidator()
		// Act
		let isFirstNameShort = sut.isFirstNameValid(firstName: "t")
		
		// Assert
		
		XCTAssertFalse(isFirstNameShort, "The isFirstNameValid() should have return FALSE for a short first name, short than \(SignupConstants.firstNameMinlength) character  but returned TRUE")
		
	}
	
	func testSignupFormModelValidator_WhenUserFirstNameIsTooLon_ShouldReturnFalse() {
		
		// act
		let isFirstNameToolong = sut.isFirstNameValid(firstName: "gggggggggggggggggggggggggggg")
		
		
		// Assert
		
		XCTAssertFalse(isFirstNameToolong, "The isFirstNameValid() should have return FALSE for a first name longer than \(SignupConstants.firstNameMaxLength) character  but returned TRUE")
	}
	
	// Last Name Validation
	
	func testSignupFormModelValidator_WhenUserLastNameIsProvided_ShouldReturnTrue() {
		
		// Arrange
		//		let sut = SignupFormModelValidator()
		
		// Act
		let isLastNamevalid = sut.isLastNameValid(lastName: "Ayodeji")
		
		// Assert
		XCTAssertTrue(isLastNamevalid, "The isLastNameValid() should have return TRUE for a valid Las name  but returned false")
		
	}
	
	func testSignupFormModelValidator_WhenUserLastNameIsTooShort_ShouldReturnFalse(){
		
		// Arrange
		//		let sut = SignupFormModelValidator()
		// Act
		let isLastNameShort = sut.isLastNameValid(lastName: "t")
		
		// Assert
		
		XCTAssertFalse(isLastNameShort, "The isLastNameValid() should have return FALSE for a short first name, short than \(SignupConstants.lastNameMinlength) character  but returned TRUE")
		
	}
	
	func testSignupFormModelValidator_WhenUserLastNameIsTooLong_ShouldReturnFalse() {
		
		// act
		let isLastNameToolong = sut.isLastNameValid(lastName: "gggggggggggggggggggggggggggg")
		
		
		// Assert
		
		XCTAssertFalse(isLastNameToolong, "The isLastNameValid() should have return FALSE for a Last name longer than \(SignupConstants.lastNameMaxLength) character  but returned TRUE")
	}
	
	//MARK: - Email Validation
	
	// WHEN valid Email is provided
	
	func testSignupFormModelValidator_WhenValidEmailIsProvided_ShouldReturnTrue() {
		
		// Act
		let isEmailValidFormat = sut.isEmailValidFormat(email: "test@test.com")
		
		// Assert
		
		XCTAssertTrue(isEmailValidFormat, "Provided valid email address format but validation did not pass")
	}
	
	// When invalid Email is provided
	
	func testSignupFormModelValidator_WhenInValidEmailIsProvided_ShouldReturnFalse() {
		
		// Act
		let isEmailInValidFormat = sut.isEmailValidFormat(email: "test@tc")
		
		// Assert
		
		XCTAssertFalse(isEmailInValidFormat, "Provided invalid email address format but validation did still passed")
	}
	
	
	// MARK: Password Validation
	
		func testSignupFormModelValidator_WhenValidPasswordProvided_ShouldReturnTrue() {
				
				// Act
				let isPasswordValid = sut.isPasswordValid(password: "12345678")
				
				// Assert
				XCTAssertTrue(isPasswordValid, "The isPasswordValid() should have returned TRUE for a valid password  but it has returned FALSE")
				
		}
		
		func testSignupFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnFalse() {
				
				// Act
				let isPasswordValid = sut.isPasswordValid(password: "12")
				
				// Assert
				XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is shorter than \(SignupConstants.passwordMinLength) but it has returned TRUE")
				
		}
		
		func testSignupFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse() {
				
				// Act
				let isPasswordValid = sut.isPasswordValid(password: "12345678901234567")
				
				// Assert
				XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is longer than \(SignupConstants.passwordMaxLength) but it has returned TRUE")
				
		}
		
		func testSignupFormModelValidator_WhenEqualPasswordsProvided_ShouldReturnTrue() {
				// Act
				let doPasswordsMatch = sut.doPasswordsMatch(password: "12345678", repeatPassword:"12345678")
				
				// Assert
				XCTAssertTrue(doPasswordsMatch, "The doPasswordsMatch() should have returned TRUE for matching passwords but it has returned FALSE")
		}
		
		func testSignupFormModelValidator_WhenNotMatchingPasswordsProvided_ShouldReturnFalse() {
				// Act
				let doPasswordsMatch = sut.doPasswordsMatch(password: "12345678", repeatPassword: "1234678")
				
				// Assert
				XCTAssertFalse(doPasswordsMatch, "The doPasswordsMatch() should have returned FALSE for passwords that do not match but it has returned TRUE")
		}
	
}
