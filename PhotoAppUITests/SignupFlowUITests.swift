//
//  PhotoAppUITests.swift
//  PhotoAppUITests
//
//  Created by Ayodeji Ayankola on 22/03/2023.
//

import XCTest

final class SignupFlowUITests: XCTestCase {
	private var app : XCUIApplication!
	private var firstName : XCUIElement!
	private var lastName : XCUIElement!
	private var email : XCUIElement!
	private var password : XCUIElement!
	private var repeatPassword : XCUIElement!
	private var signupButton : XCUIElement!
				 
		
    override func setUpWithError() throws {
			
				// Put setup code here. This method is called before the invocation of each test method in the class.
			
			try super.setUpWithError()
			
			app = XCUIApplication()
		 	app.launchArguments = ["-skipSurvey","-debugServer"]
			app.launchEnvironment = ["signupUrl":"https:stageurl",
															 "inAppPurchase":"true",
															 "inAppAdsEnabled": "true"]
			
			app.launch()
			// using accessibility
			firstName = app.textFields["firstNameTextField"]
			lastName = app.textFields["lastNameTextField"]
		email = app.textFields["emailTextField"]
//			password = app.secureTextFields["password"]
			password = app.textFields["password"]
			repeatPassword = app.textFields["repeatPassword"]
			signupButton =  app.buttons["signupButton"]
						 

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
			
			app = nil
			try super.tearDownWithError()
    }

    func testSignupViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {
			
			// using ui elements position
//
//			let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
//			element.children(matching: .textField).element(boundBy: 0).tap()
//			element.children(matching: .textField).element(boundBy: 1).tap()
//			element.children(matching: .textField).element(boundBy: 2).tap()
//
//			let secureTextField = element.children(matching: .secureTextField).element
//			secureTextField.tap()
//			element.children(matching: .textField).element(boundBy: 3).tap()
//			app.buttons["Sign up"].tap()
			
//			app.textFields["First Name"].tap()
//			app.textFields["Last Name"].tap()
//			app.textFields["Email"].tap()
//			app.secureTextFields["Password"].tap()
//			app.textFields["Repeat Password"].tap()
//			app/*@START_MENU_TOKEN@*/.staticTexts["Sign up"]/*[[".buttons[\"Sign up\"].staticTexts[\"Sign up\"]",".staticTexts[\"Sign up\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//
			// using placeholder
//			let firstName = app.textFields["First Name"]
//			let lastName = app.textFields["Last Name"]
//			let email = app.textFields["Email"]
//			let Password = app.secureTextFields["Password"]
//			let repeatPassword = app.textFields["Repeat Password"]
//			 app/*@START_MENU_TOKEN@*/.staticTexts["Sign up"]/*[[".buttons[\"Sign up\"].staticTexts[\"Sign up\"]",".staticTexts[\"Sign up\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/

									// using accessibility
						 
//			XCTAssertFalse(firstName.isEnabled, "First Name Textfield is not enabled for user interaction")
			XCTAssertTrue(firstName.isEnabled, "First Name Textfield is not enabled for user interaction")
			XCTAssertTrue(lastName.isEnabled, "Last Name Textfield is not enabled for user interaction")
			XCTAssertTrue(email.isEnabled, "Email Textfield is not enabled for user interaction")
			XCTAssertTrue(password.isEnabled, "Password Textfield is not enabled for user interaction")
			XCTAssertTrue(repeatPassword.isEnabled, "Repeat Password Textfield is not enabled for user interaction")
			
    }
	
	func testSignupViewController_WhenInvalidFormSubmitted_PresentsErrorAlertDialog() throws {
		// UI tests must launch the application that they test.
		
		firstName.tap()
		firstName.typeText("Tu")
		
		lastName.tap()
		lastName.typeText("yT")
		
		email.tap()
		email.typeText("test")
		
		password.tap()
		password.typeText("123")
		
		repeatPassword.tap()
		repeatPassword.typeText("12")
		
		
		
		//Act
		signupButton.tap()
		
		// Taking screenshot of specific UI element
		let emailTextFieldScreenshot = email.screenshot()
		let emailTextFieldAttachment = XCTAttachment(screenshot: emailTextFieldScreenshot)
		emailTextFieldAttachment.name = "Screenshot of Email UITextField"
		emailTextFieldAttachment.lifetime = .keepAlways
		add(emailTextFieldAttachment)
		
		// Taking screenshot of current Device screen
//		let currentAppWindow = app.screenshot()
//		let currentAppWindowAttachment = XCTAttachment(screenshot: currentAppWindow)
//		currentAppWindowAttachment.name = "Signup page screenshot"
//		currentAppWindowAttachment.lifetime = .keepAlways
//		add(currentAppWindowAttachment)
		

		let currentAppWindow = XCUIScreen.main.screenshot()
//		let currentAppWindow = app.screenshot()
		let currentAppWindowAttachment = XCTAttachment(screenshot: currentAppWindow)
		currentAppWindowAttachment.name = "Signup page screenshot"
		currentAppWindowAttachment.lifetime = .keepAlways
		add(currentAppWindowAttachment)
		
		// Assert
		XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 3), "An error Alert dailog was not presented when invalid signup form was submitted")
		
		
//		 app/*@START_MENU_TOKEN@*/.staticTexts["Sign up"]/*[[".buttons[\"Sign up\"].staticTexts[\"Sign up\"]",".staticTexts[\"Sign up\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
	}

	
	func testSignupViewController_WhenValidFormSubmitted_PresentsSuccessAlertDialog() throws {
		// UI tests must launch the application that they test.
		
		firstName.tap()
		firstName.typeText("Tuiop")
		
		lastName.tap()
		lastName.typeText("yTyrtyuddd")
		
		email.tap()
		email.typeText("test@tes.com")
		
		password.tap()
		password.typeText("12tyuut669")
		
		repeatPassword.tap()
		repeatPassword.typeText("12tyuut669")
		
		
		//Act
		signupButton.tap()
		
		// Assert
		XCTAssertTrue(app.alerts["successAlertDialog"].waitForExistence(timeout: 3), "An success Alert dailog was not presented when valid signup form was submitted")
		
		
//		 app.staticTexts["Sign up"]
	}

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
