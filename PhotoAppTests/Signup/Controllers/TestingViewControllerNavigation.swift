//
//  TestingViewControllerNavigation.swift
//  PhotoAppTests
//
//  Created by Ayodeji Ayankola on 21/03/2023.
//

import XCTest
@testable import PhotoApp

final class TestingViewControllerNavigation: XCTestCase {

	  var sut: FirstViewController!
	var navigationController: UIViewController!
	
	
    override func setUpWithError() throws {
			// Step 1: Create an instance of uistoryboard
			let storyboard = UIStoryboard(name: "Main", bundle: nil)
			
			// Step 2. Instantiate UIViewController with storyboard ID
			sut = storyboard.instantiateViewController(withIdentifier: "FirstViewController") as? FirstViewController
			navigationController = UINavigationController(rootViewController: sut)
			
			// Step 3: Make the ViewDidLoad() execute
			sut.loadViewIfNeeded()
			
    }

    override func tearDownWithError() throws {
       sut = nil
			navigationController = nil
    }

	func testNextViewButton_WhenTapped_SecondViewControllerPushed(){
		let myPredicate  = NSPredicate { input, _ in
			return (input as? UINavigationController)?.topViewController is SecondViewController
		}
		expectation(for: myPredicate, evaluatedWith: navigationController)
		
		sut.nextViewButton.sendActions(for: .touchUpInside)
		
		waitForExpectations(timeout: 1.5)
		
//		guard let _ = navigationController.navigationController?.topViewController as? SecondViewController else {
//			XCTFail()
//			return
//			
//		}
    }
	
	func testNextViewButton_WhenTapped_SecondViewControllerPushed_V2() {
		sut.nextViewButton.sendActions(for: .touchUpInside)
		
//		RunLoop.current.run(until: Date())
		
		RunLoop.current.run(until: Date())
		
		guard let _ = navigationController.navigationController?.topViewController
		as? SecondViewController
		else {
			XCTFail()
			return
			
		}
	}
	
	
	
	func testNextViewButton_WhenTapped_SecondViewControllerPushed_V3() {
		let spyNavigationController = SpyViewController(rootViewController: sut)
		sut.nextViewButton.sendActions(for: .touchUpInside)
		
		guard let _ = spyNavigationController.pushedViewController
		as? SecondViewController
		else {
			XCTFail()
			return
			
		}
	}

	

}
 
