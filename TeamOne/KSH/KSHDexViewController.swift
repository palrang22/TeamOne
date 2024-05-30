//
//  KSHDexViewController.swift
//  TeamOne
//
//  Created by 김승희 on 5/28/24.
//

import UIKit

class KSHDexViewController: UIViewController, UIPageViewControllerDelegate{
    
    private let avatars = ["characterFront", "characterRight", "characterBack", "characterLeft"]
    private var avatarsIdx = 0
    private var pages = [UIViewController]()
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarsIdx = 0
        avatarImage.image = UIImage(named: avatars[avatarsIdx])
        setupViewController()
        configSegControl()
    }
    
    @IBAction func turnRightButton(_ sender: Any) {
        avatarsIdx += 1
        if avatarsIdx > 3 {
            avatarsIdx = 0
        }
        avatarImage.image = UIImage(named: avatars[avatarsIdx])
    }
    @IBAction func turnLeftButton(_ sender: Any) {
        avatarsIdx -= 1
        if avatarsIdx < 0 {
            avatarsIdx = 3
        }
        avatarImage.image = UIImage(named: avatars[avatarsIdx])
    }
    
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        let selectedIdx = sender.selectedSegmentIndex
        switchViewController(to: pages[selectedIdx])
    }
    
    private func setupViewController() {
        let storyboard = UIStoryboard(name: "KSHStoryboard", bundle: nil)
        let vc1 = storyboard.instantiateViewController(withIdentifier: "FirstPage")
        let vc2 = storyboard.instantiateViewController(withIdentifier: "SecondPage")
        let vc3 = storyboard.instantiateViewController(withIdentifier: "ThirdPage")
        pages = [vc1, vc2, vc3]
    }
    
    private func switchViewController(to newViewController: UIViewController) {
        
        for child in children {
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
        
        addChild(newViewController)
        newViewController.view.frame = containerView.bounds
        containerView.addSubview(newViewController.view)
        newViewController.didMove(toParent: self)
    }
    
    private func configSegControl() {
        segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        switchViewController(to: pages[0])
    }
    
    
    private func configViewController() {
        containerView.layer.cornerRadius = 10
        containerView.layer.borderColor = UIColor.gray.cgColor
    }
    

}
