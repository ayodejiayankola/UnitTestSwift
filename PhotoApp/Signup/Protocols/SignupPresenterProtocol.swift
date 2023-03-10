//
//  SignupPresenterProtocol.swift
//  PhotoApp
//
//  Created by Ayodeji Ayankola on 10/03/2023.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
	
	init(formModelValidator: SignupModelValidatorProtocol,
			 webService: SignupWebServiceProtocol,
			 delegate: SignupViewDelegateProtocol)
	func processUserSignup(formModel: SignupFormModel)
}
