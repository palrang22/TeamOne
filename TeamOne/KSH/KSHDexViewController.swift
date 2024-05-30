//
//  KSHDexViewController.swift
//  TeamOne
//
//  Created by 김승희 on 5/28/24.
//

import UIKit

class KSHDexViewController: UIViewController, UIPageViewControllerDelegate{
    
    private var pageViewController : KSHSegController!
    
    private let avatars = ["characterFront", "characterRight", "characterBack", "characterLeft"]
    private var avatarsIdx = 0
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPageViewController()
        configSegControl()
        avatarsIdx = 0
        avatarImage.image = UIImage(named: avatars[avatarsIdx])
        //configSegController()
        configViewController()
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
    
//    private func configSegController(){
//        segmentedControl.layer.cornerRadius = 20
//        segmentedControl.clipsToBounds = true
//    }
    
    private func configViewController() {
        containerView.layer.cornerRadius = 10
        containerView.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func loadPageViewController() {
        pageViewController = storyboard?.instantiateViewController(withIdentifier: "KSHSegController") as? KSHSegController
        pageViewController.delegate = self
        pageViewController.willMove(toParent: self)
        addChild(pageViewController)
        containerView.addSubview(pageViewController.view)
        pageViewController.view.frame = containerView.bounds
        pageViewController.didMove(toParent: self)
    }
    
    private func configSegControl() {
        segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        pageViewController.setViewControllers(at: 0)
    }
    
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        pageViewController.setViewControllers(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let currentViewController = pageViewController.viewControllers?.first,
               let KSHPageViewController = pageViewController as? KSHSegController,
               let index = KSHPageViewController.pages.firstIndex(of: currentViewController) {
                segmentedControl.selectedSegmentIndex = index
            }
        }
    }
}
