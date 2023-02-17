//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by Ayodeji Ayankola on 06/02/2023.
//

import Foundation

class SignupFormModelValidator {
	
	
	func isFirstNameValid(firstName: String) -> Bool {
		var returnValue = true
		
		if firstName.count < SignupConstants.firstNameMinlength || firstName.count > SignupConstants.firstNameMaxLength {
			returnValue = false
		}
		
		return returnValue
	}
	
	func isLastNameValid(lastName: String) -> Bool {
		var returnValue = true
		
		if lastName.count < SignupConstants.lastNameMinlength || lastName.count > SignupConstants.lastNameMaxLength {
			returnValue = false
		}
		
		return returnValue
	}
	
	
	func isEmailValidFormat(email: String) -> Bool {
		return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
	}
	
	
	func isPasswordValid(password: String) -> Bool {
		var returnValue = true
		
		if password.count < SignupConstants.passwordMinLength ||
				password.count > SignupConstants.passwordMaxLength {
			returnValue = false
		}
		
		return returnValue
	}
	
	func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
		return password == repeatPassword
	}
}
