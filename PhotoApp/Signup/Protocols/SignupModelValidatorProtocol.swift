//
//  SignupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by Ayodeji Ayankola on 28/02/2023.
//

import Foundation

protocol SignupModelValidatorProtocol {
	func isFirstNameValid(firstName: String) -> Bool
	
	func isLastNameValid(lastName: String) -> Bool
	
	
	func isEmailValidFormat(email: String) -> Bool
	
	func isPasswordValid(password: String) -> Bool
	
	func doPasswordsMatch(password: String, repeatPassword: String) -> Bool
}
