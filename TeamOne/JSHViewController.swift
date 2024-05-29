//
//  JSHViewController.swift
//  TeamOne
//
//  Created by 김승희 on 5/27/24.
//

import UIKit

var images = ["01.jpeg", "02.jpeg"]

class JSHViewController: UIViewController {

    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = UIColor.black
        imgView.image = UIImage(named: images[0])
    }
    
   
    @IBAction func openWebsite(_ sender: UIButton) {
        if let url = URL(string:"https://velog.io/@apam144/posts"){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    
    
    @IBAction func pageChanged(_ sender: Any) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    


}
