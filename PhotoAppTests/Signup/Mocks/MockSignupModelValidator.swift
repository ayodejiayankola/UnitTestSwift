//
//  MockSignupModelValidator.swift
//  PhotoAppTests
//
//  Created by Ayodeji Ayankola on 23/02/2023.
//

import Foundation

@testable import PhotoApp

class MockSignupModelValidator: SignupModelValidatorProtocol {
	
	var isFirstNameValidated: Bool = false
	var isLastNameValidated: Bool = false
	var isEmailFormatValidated: Bool = false
	var isPasswordValidated: Bool = false
	var isPasswordEqualityValidated: Bool = false
	
	func isFirstNameValid(firstName: String) -> Bool {
		isFirstNameValidated = true
		return isFirstNameValidated
	}
	
	func isLastNameValid(lastName: String) -> Bool {
		isLastNameValidated = true
		return isLastNameValidated
	}
	
	func isEmailValidFormat(email: String) -> Bool {
		isEmailFormatValidated = true
		return isEmailFormatValidated
	}
	
	func isPasswordValid(password: String) -> Bool {
		isPasswordValidated = true
		return isPasswordValidated
	}
	
	func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
		isPasswordEqualityValidated = true
		return isPasswordValidated
	}
}
