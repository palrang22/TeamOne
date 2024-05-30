//
//  SplashViewController.swift
//  TeamOne
//
//  Created by 임혜정 on 5/30/24.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {

    private var animationView: LottieAnimationView = {
      let lottieAnimationView = LottieAnimationView(name: "SplashAnimation")
      return lottieAnimationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        animationView = LottieAnimationView(name: "SplashAnimationJ") // JSON 파일 이름 (확장자 제외)
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.animationSpeed = 1.0
        view.addSubview(animationView)
        
        animationView.play { [weak self] (finished) in
            self?.showMainScreen()
        }
        
        // 애니메이션 후 메인 화면으로 전환
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.showMainScreen()
        }
    }
    
    private func showMainScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "UINavigationController")
        mainViewController.modalTransitionStyle = .crossDissolve
        mainViewController.modalPresentationStyle = .fullScreen
        present(mainViewController, animated: true, completion: nil)
    }
    
}
