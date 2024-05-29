//
//  KSHSegController.swift
//  TeamOne
//
//  Created by 김승희 on 5/28/24.
//

import UIKit

class KSHSegController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var pages = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        setupViewController()
        configViewController()
    }
    
    private func setupViewController() {
        let storyboard = UIStoryboard(name: "KSHStoryboard", bundle: nil)
        let vc1 = storyboard.instantiateViewController(withIdentifier: "FirstPage")
        let vc2 = storyboard.instantiateViewController(withIdentifier: "SecondPage")
        let vc3 = storyboard.instantiateViewController(withIdentifier: "ThirdPage")
        pages = [vc1, vc2, vc3]
    }
    
    private func configViewController() {
        guard let first = pages.first else { return }
        setViewControllers([first], direction: .forward, animated: true)
    }
    
    func setViewControllers(at index: Int) {
        guard index >= 0 && index < pages.count else {
            return
        }
        
        let direction: UIPageViewController.NavigationDirection = index > (viewControllers?.first?.view.tag ?? 0) ? .forward : .reverse
        setViewControllers([pages[index]], direction: direction, animated: true, completion: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < pages.count else {
            return nil
        }
        
        return pages[nextIndex]
    }
}
