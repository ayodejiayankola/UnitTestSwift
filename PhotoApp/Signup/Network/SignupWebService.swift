//
//  SignupWebService.swift
//  PhotoApp
//
//  Created by Ayodeji Ayankola on 14/02/2023.
//

import Foundation

class SignupWebService: SignupWebServiceProtocol {
	
	// constructor based dependency injection
	private var urlSession: URLSession
	private var urlString: String
	
	init(urlSession: URLSession = .shared, urlString: String) {
		self.urlSession = urlSession
		self.urlString = urlString
	}
	
	func signup(withForm signupFormRequestModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
		guard let url = URL(string: urlString) else {
			// TODO: create a unit test to test that a specific error message is returned is URL is nil
			completionHandler(nil, SignupError.invalidRequestURLString)
			
			return
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		request.httpBody = try? JSONEncoder().encode(signupFormRequestModel)
		
		let dataTask = urlSession .dataTask(with: request) { (data, response, error) in
			//TODO: Write a new unit test to handle an eror here
			
			
			if let requestError = error {
				completionHandler(nil, SignupError.failedRequest(description: requestError.localizedDescription) )
				return
			}
			
			if let data = data, let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel
				.self, from: data){
				completionHandler(signupResponseModel, nil)
			} else {
				//TODO: Write a new unit test to handle an eror here
				completionHandler(nil, SignupError.invalidResponseModel)
			}
		}
		
		
		dataTask.resume()
		
	}
	
}


