//
//  MockSignupPresenter.swift
//  PhotoAppTests
//
//  Created by Ayodeji Ayankola on 10/03/2023.
//

import Foundation
@testable import PhotoApp

class MockSignupPresenter: SignupPresenterProtocol {
	
	var processUserSignupCalled: Bool = false
	
	required init(formModelValidator: PhotoApp.SignupModelValidatorProtocol, webService: PhotoApp.SignupWebServiceProtocol, delegate: PhotoApp.SignupViewDelegateProtocol) {
		// Todo
	}
	
	func processUserSignup(formModel: PhotoApp.SignupFormModel) {
		processUserSignupCalled = true
	}
}
