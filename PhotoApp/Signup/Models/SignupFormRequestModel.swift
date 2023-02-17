//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by Ayodeji Ayankola on 14/02/2023.
//

import Foundation

struct SignupFormRequestModel: Encodable {
	let firstName: String
	let lastName: String
	let email: String
	let password: String
}
