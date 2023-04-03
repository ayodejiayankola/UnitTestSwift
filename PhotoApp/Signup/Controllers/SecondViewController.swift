//
//  SecondViewController.swift
//  PhotoApp
//
//  Created by Ayodeji Ayankola on 21/03/2023.
//

import UIKit

class SecondViewController: UIViewController {

	@IBOutlet weak var goBackButton: UIButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
	@IBAction func goBackAction(_ sender: UIButton) {
		self.dismiss(animated: true)
	}
	
}
