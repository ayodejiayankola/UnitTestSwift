//
//  SignupViewDelegateProtocol.swift
//  PhotoApp
//
//  Created by Ayodeji Ayankola on 04/03/2023.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
	func successfullsignup()
	func errorHandler(error: SignupError)
}
