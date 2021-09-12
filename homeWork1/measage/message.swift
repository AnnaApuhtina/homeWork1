//
//  message.swift
//  homeWork1
//
//  Created by admin on 12.09.2021.
//

import UIKit


class messageViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func friendsButton(_ sender: Any) {
        self.tabBarController?.selectedIndex = 2
    }
}
