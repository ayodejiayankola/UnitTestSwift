//
//  MockSignupViewDelegate.swift
//  PhotoAppTests
//
//  Created by Ayodeji Ayankola on 04/03/2023.
//

import Foundation
import XCTest
@testable import PhotoApp

class MockSignupViewDelegate: SignupViewDelegateProtocol {
	
	var expectation: XCTestExpectation?
	var successfulSignupCounter = 0
	var errorHandlerCounter = 0
	var signupError: SignupError?
	
	func successfullsignup() {
		successfulSignupCounter += 1
		expectation?.fulfill()
	}
	
	func errorHandler(error: SignupError) {
		// TODO
		signupError = error
		
		errorHandlerCounter += 1
		expectation?.fulfill()
		
	}
}
