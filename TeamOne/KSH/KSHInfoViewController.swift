//
//  KSHInfoViewController.swift
//  TeamOne
//
//  Created by 김승희 on 5/30/24.
//

import UIKit

class KSHInfoViewController: UIViewController {
    
    @IBOutlet weak var buttonBackGround: UIView!
    @IBOutlet weak var tag1: UIView!
    @IBOutlet weak var tag2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configButtonBackGround()
        configtag()
    }
    
    @IBAction func velogButton(_ sender: Any) {
        openURL("https://velog.io/@palrang22/posts")
    }
    @IBAction func githubButton(_ sender: Any) {
        openURL("https://github.com/palrang22")
    }
    @IBAction func mailButton(_ sender: Any) {
        copyToClipboard("merrymerrys2@naver.com")
    }
    
    private func configtag() {
        tag1.layer.cornerRadius = 5
        tag1.layer.shadowColor = UIColor.black.cgColor
        tag1.layer.shadowRadius = 2
        tag1.layer.shadowOpacity = 0.3
        tag1.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        
        tag2.layer.cornerRadius = 5
        tag2.layer.shadowColor = UIColor.black.cgColor
        tag2.layer.shadowRadius = 2
        tag2.layer.shadowOpacity = 0.3
        tag2.layer.shadowOffset = CGSize(width: 1, height: 1)
    }
    
    private func openURL(_ urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    private func copyToClipboard(_ text: String) {
        UIPasteboard.general.string = text
        showAlert("메일주소가 복사되었습니당")
    }
    
    private func showAlert(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "넹", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func configButtonBackGround() {
        buttonBackGround.layer.cornerRadius = 10
    }

}
