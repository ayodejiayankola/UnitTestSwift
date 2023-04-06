//
//  SignupViewController.swift
//  PhotoApp
//
//  Created by Ayodeji Ayankola on 07/03/2023.
//

import UIKit

class SignupViewController: UIViewController {

	@IBOutlet weak var firstNameTextField: UITextField!
	
	@IBOutlet weak var lastNameTextField: UITextField!
	
	@IBOutlet weak var emailTextField: UITextField!
	
	@IBOutlet weak var passwordTextField: UITextField!
	
	@IBOutlet weak var repeatPasswordTextField: UITextField!
	@IBOutlet weak var signupButton: UIButton!
	
	var signupPresenter: SignupPresenterProtocol?
	
    override func viewDidLoad() {
        super.viewDidLoad()

//			#if DEBUG
//			if CommandLine.arguments.contains("-skipSurvey"){
//				print("Skipping survey page")
//			}
//			#endif
//
//			#if DEBUG
//			if ProcessInfo.processInfo.arguments.contains("-skipSurvey"){
//				print("Skipping survey page")
//			}
//			#endif
			
        // Do any additional setup after loading the view.
			if signupPresenter == nil {
				let signupModelValidator = SignupFormModelValidator()
				
				let signupURL = ProcessInfo.processInfo.environment["signupUrl"] ?? SignupConstants.signupURLString
				
//				let webservice = SignupWebService(urlString: SignupConstants.signupURLString)
				let webservice = SignupWebService(urlString: signupURL)
				signupPresenter = SignupPresenter(formModelValidator: signupModelValidator, webService: webservice, delegate: self)
			}
    }
    
	@IBAction func signupButtonTapped(_ sender: Any) {
		let signupFormModel = SignupFormModel(firstName: firstNameTextField.text ?? "", lastName: lastNameTextField.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "", repeatPassword: repeatPasswordTextField.text ?? "")
 		signupPresenter?.processUserSignup(formModel: signupFormModel)
		
	}
	
}

extension SignupViewController: SignupViewDelegateProtocol {
	func successfullsignup() {
		// TODO:
		
		
		let alert = UIAlertController(title: "Success", message: "Your request was processed", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		
		DispatchQueue.main.async {
			alert.view.accessibilityIdentifier = "successAlertDialog"
			self.present(alert, animated: true, completion: nil)
		}
	}
	
	func errorHandler(error: SignupError) {
		// TODO:
		let alert = UIAlertController(title: "Error", message: "Your request could not be processed at this time", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		
		DispatchQueue.main.async {
			alert.view.accessibilityIdentifier = "errorAlertDialog"
			self.present(alert, animated: true, completion: nil)
		}
	}
	
	
}
