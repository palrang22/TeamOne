//
//  KLIViewController.swift
//  TeamOne
//
//  Created by 김승희 on 5/27/24.
//

import UIKit
import AVFoundation


class KLIViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var linkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
       
        

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        linkButton.backgroundColor = UIColor.gray
        if let url = URL(string: "https://kimrinoffcoding.tistory.com/") {
            UIApplication.shared.open(url)
        }
        
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
