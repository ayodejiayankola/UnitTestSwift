//
//  SpyViewController.swift
//  PhotoAppTests
//
//  Created by Ayodeji Ayankola on 21/03/2023.
//

import UIKit

class SpyViewController: UINavigationController {

	var pushedViewController: UIViewController!
	
	override func pushViewController(_ viewController: UIViewController, animated: Bool) {
		super.pushViewController(viewController, animated: animated)
		pushedViewController = viewController
	}

}
