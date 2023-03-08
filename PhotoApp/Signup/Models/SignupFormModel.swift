//
//  SignupFormModel.swift
//  PhotoApp
//
//  Created by Ayodeji Ayankola on 23/02/2023.
//

import Foundation

struct SignupFormModel: Encodable {
	let firstName: String
	let lastName: String
	let email: String
	let password: String
	let repeatPassword: String
}
