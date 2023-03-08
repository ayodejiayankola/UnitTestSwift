//
//  SignupPresentersTests.swift
//  PhotoAppTests
//
//  Created by Ayodeji Ayankola on 23/02/2023.
//

import XCTest
@testable import PhotoApp

final class SignupPresentersTests: XCTestCase {
	
	
	//	var sut: SignupFormModelValidator!
	// Arrange
	var signupFormModel: SignupFormModel!
	var mockSignupModelValidator: MockSignupModelValidator!
	var mockSignupWebService: MockSignupWebService!
	var mockSignupViewDelegate: MockSignupViewDelegate!
	
	var sut: SignupPresenter!
	
	
	override func setUpWithError() throws {
		// Put setup code here. This method is called before the invocation of each test method in the class.
		// Arrange
		signupFormModel = SignupFormModel(firstName: "Test",
																			lastName: "Greym",
																			email: "test@test.com",
																			password: "1234567889",
																			repeatPassword: "1234567889")
		mockSignupModelValidator = MockSignupModelValidator()
		mockSignupWebService = MockSignupWebService()
	  mockSignupViewDelegate = MockSignupViewDelegate()
		
		sut = SignupPresenter(
			formModelValidator: mockSignupModelValidator,
			webService: mockSignupWebService,
			delegate: mockSignupViewDelegate
		)
	}
	
	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		signupFormModel = nil
		mockSignupModelValidator = nil
		mockSignupWebService = nil
		mockSignupViewDelegate = nil
	}
	
	func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty(){
		// Arrange
		// Act
		sut.processUserSignup(formModel: signupFormModel)
		
		
		// Assert
		XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "First name was no validated")
		XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "Last name was no validated")
		XCTAssertTrue(mockSignupModelValidator.isEmailFormatValidated, "Email Format was no validated")
		XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "Password was no validated")
		XCTAssertTrue(mockSignupModelValidator.isPasswordEqualityValidated, "Did not validate if password match")
		
	}
	
	
	func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod(){
		// Arrange
		
		// Act
		sut.processUserSignup(formModel: signupFormModel)
		
		
		// Assert
		XCTAssertTrue(mockSignupWebService.isSignupMethodCalled, "The signup() Method was not called in the SignupWebService Class")
	}
	
	
	func testSignupPresenter_WhenSignupOperationSuccessful_CallsSuccessOnViewDelegate() {
		// Arrange
		let myExpectation = expectation(description: "Expected the successfulSignup() method to be called")
		mockSignupViewDelegate.expectation = myExpectation
		
		// Act
		sut.processUserSignup(formModel: signupFormModel)
		
		self.wait(for: [myExpectation], timeout: 5)
		
		// Assert
		XCTAssertEqual(mockSignupViewDelegate.successfulSignupCounter, 1 , "The successfulSignup() method was called more than one time")
	}
	
	
	func testSignupPresenter_WhenSignupOperationUnSuccessful_ShouldCallErronOnDelegate() {
		// Arrange
		let myExpectation = expectation(description: "Expected the erroronHandler() method to be called")
		mockSignupViewDelegate.expectation = myExpectation
//		mockSignupViewDelegate.shouldReturnError = true
		mockSignupWebService.shouldReturnError = true
		
		// Act
		sut.processUserSignup(formModel: signupFormModel)
		self.wait(for: [myExpectation], timeout: 5)
		
		// Assert
		XCTAssertEqual(mockSignupViewDelegate.successfulSignupCounter, 0)
		XCTAssertEqual(mockSignupViewDelegate.errorHandlerCounter, 1)
//		XCTAssertNil(mockSignupViewDelegate.signupError)
		XCTAssertNotNil(mockSignupViewDelegate.signupError)
	}
}
