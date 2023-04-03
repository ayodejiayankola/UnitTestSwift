//
//  SignupErrors.swift
//  PhotoApp
//
//  Created by Ayodeji Ayankola on 16/02/2023.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
		
		case invalidResponseModel
		case invalidRequestURLString
	  case illegalCharactersFound
	case isInvalidFirstName
	case isInvalidLastName
	case isInvalidEmail
	case isInvalidPassword
	case passwordsDoNotMatch
		case failedRequest(description: String)
		
		var errorDescription: String? {
				switch self {
				case .failedRequest(let description):
						return description
				case .invalidResponseModel, .invalidRequestURLString, .illegalCharactersFound:
						return ""
				case .isInvalidFirstName:
					return ""
				case .isInvalidLastName:
					return ""
				case .isInvalidEmail:
					return ""
				case .isInvalidPassword:
					return ""
				case .passwordsDoNotMatch:
					return ""
				}
		}
		
}
