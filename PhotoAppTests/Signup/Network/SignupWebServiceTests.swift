//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Ayodeji Ayankola on 14/02/2023.
//

import XCTest
@testable import PhotoApp

final class SignupWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
	
	// MARK: - Test SignupWebService Class
	func testSignupWebService_WhenGivenSuccessFullResponse_ReturnsSuccess() {
		
		// Arrange
		
		let config = URLSessionConfiguration.ephemeral
		config.protocolClasses = [MockURLProtocol.self]
		let urlSession = URLSession(configuration: config)
		let jsonString = "{\"status\":\"ok\"}"
//		let jsonString = "{\"status\":\"error\"}"
		MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
		
		let sut = SignupWebService(urlSession: urlSession, urlString: SignupConstants.signupURLString)
		
	
		let signupFormRequestModel  = SignupFormRequestModel(firstName: "Ayodeji", lastName: "Ayankola", email: "test@test.com", password: "123456789")
		
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

}
