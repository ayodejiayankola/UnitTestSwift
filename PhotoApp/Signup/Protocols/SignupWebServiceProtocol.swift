//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by Ayodeji Ayankola on 02/03/2023.
//

import Foundation
protocol SignupWebServiceProtocol {
	func signup(withForm signupFormRequestModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void)
}
