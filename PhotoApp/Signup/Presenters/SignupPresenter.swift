//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Ayodeji Ayankola on 23/02/2023.
//

import Foundation

class SignupPresenter: SignupPresenterProtocol {
	
	private var formModelValidator: SignupModelValidatorProtocol
	private var webService: SignupWebServiceProtocol
	private var delegate: SignupViewDelegateProtocol
	
	required init(formModelValidator: SignupModelValidatorProtocol,
			 webService: SignupWebServiceProtocol,
			 delegate: SignupViewDelegateProtocol) {
		self.formModelValidator = formModelValidator
		self.webService = webService
		self.delegate = delegate
	}
	
	func processUserSignup(formModel: SignupFormModel) {
		if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
			self.delegate.errorHandler(error: SignupError.isInvalidFirstName)
			return
		}
		
		if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
			self.delegate.errorHandler(error: SignupError.isInvalidLastName)
			return
		}
		
		if !formModelValidator.isEmailValidFormat(email: formModel.email) {
			self.delegate.errorHandler(error: SignupError.isInvalidEmail)
			return
		}
		
		if !formModelValidator.isPasswordValid(password: formModel.password) {
			self.delegate.errorHandler(error: SignupError.isInvalidPassword)
			return
		}
		
		
		if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword){
			self.delegate.errorHandler(error: SignupError.passwordsDoNotMatch)
			return
		}
		
		let requestModel = SignupFormRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
		
		webService.signup(withForm: requestModel) { [weak self]
			(responseModel, error) in
			// TODO
			if let error = error {
				self?.delegate.errorHandler(error: error)
				return
			}
			
			if let _ = responseModel {
				self?.delegate.successfullsignup()
				return
			}
			
		}
		
	}
}
