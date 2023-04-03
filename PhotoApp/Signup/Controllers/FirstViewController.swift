//
//  FirstViewController.swift
//  PhotoApp
//
//  Created by Ayodeji Ayankola on 21/03/2023.
//

import UIKit

class FirstViewController: UIViewController {

	@IBOutlet weak var nextViewButton: UIButton!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

	@IBAction func nextViewButtonTapped(_ sender: Any) {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
		secondViewController.view.accessibilityIdentifier = "secondViewController"
//		self.navigationController?.pushViewController(secondViewController, animated: true)
		self.present(secondViewController, animated: true)
	}

}
