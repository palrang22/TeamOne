//
//  IHJViewController.swift
//  TeamOne
//
//  Created by 임혜정 on 5/28/24.
//

import UIKit
import SafariServices

class IHJViewController: UIViewController {
    
    
    @IBOutlet weak var flowerImage: UIImageView!
    @IBOutlet weak var flowerImage2: UIImageView!
    
    @IBOutlet weak var contentView: UIStackView!
    @IBOutlet weak var profileDetailImageView: UIImageView!
    
    @IBOutlet weak var buttonStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(hex: "#dfedfc")
        profileDetailImageView.fadeIn(duration: 2.0)
        
        for (index, button) in buttonStackView.arrangedSubviews.enumerated() {
                    guard let button = button as? UIButton else { continue }
            button.slideInFromBottom(duration: 2.6, delay: Double(index) * 0.5)
                }
        flowerImage.fadeIn(duration: 2.0)
        flowerImage2.fadeIn(duration: 2.0)
        contentView.fadeIn(duration: 2.0)
    }
    
    
    
    @IBAction func emailButton(_ sender: Any) {
        let urlString = "https://www.naver.com"
        if let url = URL(string: urlString) {
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func gitHubButton(_ sender: Any) {
        let urlString = "https://github.com/HjeongMM"
        if let url = URL(string: urlString) {
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true, completion: nil)
        }
    }
    @IBAction func blogButton(_ sender: Any) {
        let urlString = "https://velog.io/@mmhj0129/posts"
        if let url = URL(string: urlString) {
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true, completion: nil)
        }
    }
    
    
    
}

extension UIView {
    func fadeIn(duration: TimeInterval = 2.0, delay: TimeInterval = 0.0, completion: ((Bool) -> Void)? = nil) {
        self.alpha = 0.0
        UIView.animate(withDuration: duration, delay: delay, options: [.curveEaseIn], animations: {
            self.alpha = 1.0
        }, completion: completion)
    }
}
//아래에서 올라오는 애니메이션
extension UIView {
    func slideInFromBottom(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: ((Bool) -> Void)? = nil) {
        let originalFrame = self.frame
        self.frame.origin.y += UIScreen.main.bounds.height
        UIView.animate(withDuration: duration, delay: delay, options: [.curveEaseInOut], animations: {
            self.frame = originalFrame
        }, completion: completion)
    }
}
