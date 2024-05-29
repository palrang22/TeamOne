//
//  KSHViewController.swift
//  TeamOne
//
//  Created by 김승희 on 5/27/24.
//

import UIKit

class KSHViewController: UIViewController {

    private var isDefaultImage: Bool = true
    
    @IBOutlet weak var messageImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageImg.image = UIImage(named: "defaultMessage")
    }

    @IBAction func characterTapped(_ sender: Any) {
        if isDefaultImage {
            messageImg.image = UIImage(named: "catchMessage")
            
        } else {
            performSegue(withIdentifier: "showdex", sender: self)
            messageImg.image = UIImage(named: "defaultMessage")
        }
        isDefaultImage.toggle()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var hi = "hello"
    let hello = "hii"
}
