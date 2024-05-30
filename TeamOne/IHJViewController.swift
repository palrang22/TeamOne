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
    
    @IBOutlet weak var introduceComment: UILabel!
    @IBOutlet weak var buttonStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(hex: "#dfedfc")

        for (index, button) in buttonStackView.arrangedSubviews.enumerated() {
            guard let button = button as? UIButton else { continue }
            button.slideInFromBottom(duration: 2.0, delay: Double(index) * 0.5)
        }
        let label = UILabel()
        introduceComment.frame = CGRect(x: 20, y: 50, width: 300, height: 200)
        introduceComment.numberOfLines = 0
        introduceComment.textColor = UIColor(hex: "#363636")
        introduceComment.text = "누구랑 노느냐에 따라 달라지는 메타몽 MBTI입니다. 3개월 동안 잘 협동해서 즐거운 프로젝트 시간 되었으면 좋겠고 많은 관심과 사랑부탁드립니다 모두 화이팅⭐️"
        
        // 줄간격 설정
        introduceComment.setLineSpacing(lineSpacing: 6)
        
        self.view.addSubview(label)
        profileDetailImageView.fadeIn(duration: 1.5)
        flowerImage.fadeIn(duration: 1.5)
        flowerImage2.fadeIn(duration: 1.5)
        contentView.fadeIn(duration: 1.5)
    }
    
    
    @IBAction func emailButton(_ sender: Any) {
        let urlString = "https://www.google.com/search?q=%EB%B3%B4%EB%82%B4%EC%A7%80%EB%A7%88&oq=%EB%B3%B4%EB%82%B4%EC%A7%80%EB%A7%88&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIICAEQABgFGB4yCAgCEAAYBRgeMgYIAxAAGB7SAQgzOTc4ajBqN6gCALACAA&sourceid=chrome&ie=UTF-8"
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


//요소 페이드인 애니메이션
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
        UIView.animate(withDuration: duration,
                       delay: delay,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.9,
                       options: [.curveEaseInOut],
                       animations: {
            self.frame = originalFrame
        }, completion: completion)
    }
}


extension UILabel {
    func setLineSpacing(lineSpacing: CGFloat) {
        guard let labelText = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        
        let attributedString: NSMutableAttributedString
        if let labelAttributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelAttributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        
        // 전체 텍스트에 대한 스타일 설정
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        
        self.attributedText = attributedString
    }
}
