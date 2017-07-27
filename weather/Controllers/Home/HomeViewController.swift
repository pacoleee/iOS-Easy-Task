//
//  HomeViewController.swift
//  weather
//
//  Created by Paco Lee on 2017-07-26.
//  Copyright © 2017 Paco Lee. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    static let identifier = "HomeViewController"

    @IBOutlet var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        enterButton.round(cornerRadius: 4.0)
    }

    @IBAction func enterAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Weather", bundle: nil).instantiateInitialViewController()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = vc
    }
}
