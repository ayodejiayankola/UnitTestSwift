//
//  HomePageViewController.swift
//  PhotoApp
//
//  Created by Ayodeji Ayankola on 14/03/2023.
//

import UIKit

class HomePageViewController: UIViewController {
	
	init() {
		super.init(nibName: nil, bundle: nil)
	}

	 init?(code: NSCoder) {
		fatalError("init(Coder:) has not been implemented")
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
