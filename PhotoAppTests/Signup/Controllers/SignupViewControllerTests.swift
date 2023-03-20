//
//  SignupViewControllerTests.swift
//  PhotoAppTests
//
//  Created by Ayodeji Ayankola on 07/03/2023.
//

import XCTest
@testable import PhotoApp

final class SignupViewControllerTests: XCTestCase {
	var storyboard: UIStoryboard!
	var sut : SignupViewController!
	
	override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
			storyboard = UIStoryboard(name: "Main", bundle: nil)
			sut = storyboard.instantiateViewController(identifier: "SignupViewController") as? SignupViewController
			sut?.loadViewIfNeeded()
    }

	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		storyboard = nil
		sut = nil
	}
	
	func testSignupViewController_WhenCreated_HasRequiredTextFieldsEmpty() throws {

		// To check if the iboutlet textfield is not connected
		// Act
		let firstNameTextField = try XCTUnwrap(sut.firstNameTextField, "The first name Text Field is not connected to an IBoutlet")
		let lastNameTextField = try XCTUnwrap(sut.lastNameTextField, "The last name Text Field is not connected to an IBoutlet")
		let emailTextField = try XCTUnwrap(sut.emailTextField, "Email Text Field is not connected to an IBoutlet")
		let passwordTextField = try XCTUnwrap(sut.passwordTextField, "PasswordText Field is not connected to an IBoutlet")
		let repeatPasswordTextField = try! XCTUnwrap(sut.repeatPasswordTextField, "Repeat Password Text Field is not connected to an IBoutlet")
		
		// Assert
		
		XCTAssertEqual(firstNameTextField.text, "", "First name text field was not empty when view controller initially loaded")
		XCTAssertEqual(lastNameTextField.text, "", "Last name text field was not empty when view controller initially loaded")
		XCTAssertEqual(emailTextField.text, "", "Email text field was not empty when view controller initially loaded")
		XCTAssertEqual(passwordTextField.text, "", "Password text field was not empty when view controller initially loaded")
		XCTAssertEqual(repeatPasswordTextField.text, "", "Repeat password text field was not empty when view controller initially loaded")
	}

	
	func testSignupViewController_WhenCreated_HasSignupButtonAndAction() throws {
		let signupButton: UIButton = try XCTUnwrap(sut.signupButton, "Signup Button does not having a referencing outlet")
		let signupButtonActions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Signup Button does not have any action assigned to it")
		XCTAssertEqual(signupButtonActions.count, 1)
		XCTAssertEqual(signupButtonActions.first, 	"signupButtonTapped:", "There is no action with name signupButtonTapped assigned to sinup button ")
	}
	
	func testSignupViewController_WhenSignupButtonTapped_InvokeSignupProcess() {
		// Arrange
	 let mockSignpModelValidator = MockSignupModelValidator()
		let mockSignupWebService = MockSignupWebService()
		let mockSignupViewDelegate = MockSignupViewDelegate()
		
		
		
		let mockSignupPresenter = MockSignupPresenter(formModelValidator: mockSignpModelValidator, webService: mockSignupWebService, delegate: mockSignupViewDelegate)
		
		// Act
		sut.signupPresenter = mockSignupPresenter
		sut.signupButton.sendActions(for: .touchUpInside)
		// Assert
		XCTAssertTrue(mockSignupPresenter.processUserSignupCalled, "The processUserSignup() method was not called on a presenter object when the signup button was tapped in  a signupViewController")
		
		
	}
	
	func testSignupViewController_WhenEmailTestFieldCreated_HasEmailAddressContentTypeSet() throws {
		let emailTextField = try XCTUnwrap(sut.emailTextField, "EmailAddress UITextField not connected")
		XCTAssertEqual(emailTextField.textContentType, .emailAddress, "Email Address UITextField does not have an email address content type set ")
	}
	
	
	func testSignupViewController_WhenEmailTestFieldCreated_HasEmailAddressKeyboardTypeSet() throws {
		let emailTextField = try XCTUnwrap(sut.emailTextField, "EmailAddress UITextField not connected")
		XCTAssertEqual(emailTextField.keyboardType, .emailAddress, "Email Address UITextField does not have an email address keyboard type set ")
	}
	
	func testSignupViewController_WhePasswordTestFieldCreated_HasSecureTextEntry() throws {
		let passwordTextField = try XCTUnwrap(sut.passwordTextField, "Password UITextField not connected")
//		XCTAssertEqual(passwordTextField.isSecureTextEntry, "true", "Password UITextField does not have an is secure text entry equals to true")
		XCTAssertTrue(passwordTextField.isSecureTextEntry, "Password UITextField does not have an is secure text entry equals to true")
	}
	
}
