//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Ayodeji Ayankola on 14/02/2023.
//

import XCTest
@testable import PhotoApp

final class SignupWebServiceTests: XCTestCase {
	
	var sut: SignupWebService!
	var signupFormRequestModel: SignupFormRequestModel!
	
	override func setUpWithError() throws {
		// Put setup code here. This method is called before the invocation of each test method in the class.
		
		let config = URLSessionConfiguration.ephemeral
		config.protocolClasses = [MockURLProtocol.self]
		let urlSession = URLSession(configuration: config)
		
		sut = SignupWebService(urlSession: urlSession, urlString: SignupConstants.signupURLString)
		
		signupFormRequestModel  = SignupFormRequestModel(firstName: "Ayodeji", lastName: "Ayankola", email: "test@test.com", password: "123456789")
		
	}
	
	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		sut = nil
		signupFormRequestModel = nil
		MockURLProtocol.stubResponseData = nil
		MockURLProtocol.error = nil
	}
	
	// MARK: - Test SignupWebService Class
	func testSignupWebService_WhenGivenSuccessFullResponse_ReturnsSuccess() {
		
		// Arrange
		
		
		let jsonString = "{\"status\":\"ok\"}"
		//		let jsonString = "{\"status\":\"error\"}"
		MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
		
		
		let expectation = self.expectation(description: "Signup web service expectation")
		// Act
		sut.signup(withForm: signupFormRequestModel){(signupResponseModel, error) in
			// Assert
			// Sample success response: *{status\*ok\*}*
			XCTAssertEqual(signupResponseModel?.status, "ok")
			expectation.fulfill()
		}
		self.wait(for: [expectation], timeout: 5)
		
	}
	
	func testSignupWebService_WhenReceivedDIfferentJsonResponse_ErrorTookPlace() {
		
		// Arrange
		let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
		MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
		
		let expectation = self.expectation(description: " Signup() method expectation for a response that contains a different JSON structure")
		// Act
		sut.signup(withForm: signupFormRequestModel){(signupResponseModel, error) in
			// Assert
			// Sample success response: *{status\*ok\*}*
			XCTAssertNil(signupResponseModel, "The response model for a request containing unknow JSON response. should have been nil")
			XCTAssertEqual(error, SignupError.invalidResponseModel, "The Signup() method did not return expected error ")
			expectation.fulfill()
		}
		self.wait(for: [expectation], timeout: 5)
		
	}
	
	func testSignupWebService_WhenEmptyURLStringProvided_ReturnsError() {
		// Arrange
		let expectation = self.expectation(description: "An empty url String Expectation")
		
		sut = SignupWebService(urlString: "")
		
		//Assert
		//		}
		sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
			//Act
			XCTAssertEqual(error, SignupError.invalidRequestURLString, "The Signup() method did not return an expected error for an invalidRequestURLStringError")
			XCTAssertNil(signupResponseModel, "When an invalidRequestString takes place, the response must be nil")
			expectation.fulfill()
			
		}
		self.wait(for: [expectation], timeout: 2)
	}
	
	
	func testSingupWebService_WhenURLRequestFails_ReturnErrorMessageDescription() {
		// Arrange
		let expectation = self.expectation(description: "A failed request expectation")
		let errorDescription = "A localized description of an error"
		MockURLProtocol.error = SignupError.failedRequest(description: errorDescription)
		
		// Act
		sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
    // Assert
			XCTAssertEqual(error, SignupError.failedRequest(description: "The operation couldn’t be completed. (PhotoApp.SignupError error 0.)"), "The signup() method did not return an expected erorr for the failed request ")
//			XCTAssertEqual(error, SignupError.failedRequest(description: errorDescription))
//			XCTAssertEqual(error?.localizedDescription, errorDescription)
			
			expectation.fulfill()
		}
		
		
		self.wait(for: [expectation], timeout: 2)
	}
}

