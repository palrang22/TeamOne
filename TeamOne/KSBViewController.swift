//
//  KSBViewController.swift
//  TeamOne
//
//  Created by 김승희 on 5/27/24.
//

import UIKit

class KSBViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Blog(_ sender: UIButton) {
        if let url = URL(string: "https://solby.tistory.com/") {    UIApplication.shared.open(url, options: [:])}

    }
}