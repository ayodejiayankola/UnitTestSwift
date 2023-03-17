//
//  ThrowErorrFromModelValidator.swift
//  PhotoApp
//
//  Created by Ayodeji Ayankola on 15/03/2023.
//

import Foundation

class ThrowErorrFromModelValidator {
	private let invalidCharacters = CharacterSet(charactersIn: "{@#$%^&*./!)(")
	 
	 func isMiddleNameValid(middleName: String) throws -> Bool {
		 var returnValue = true
		 
		 // check for illegal characters
		 
		 if (middleName.rangeOfCharacter(from: invalidCharacters) != nil) {
			 throw SignupError.illegalCharactersFound
		 }
		 
		 // check middle name
		 if middleName.count < SignupConstants.firstNameMinlength || middleName.count > SignupConstants.firstNameMaxLength {
			 returnValue = false
		 }
		 
		 return returnValue
	 }

	
}
