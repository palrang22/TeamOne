//
//  KSHViewController.swift
//  TeamOne
//
//  Created by 김승희 on 5/27/24.
//

import UIKit
import AVFoundation

class KSHViewController: UIViewController, AVAudioPlayerDelegate {

    private var isDefaultImage: Bool = true
    var battleAudio : AVAudioPlayer?
    var catchAudio : AVAudioPlayer?
    var winAudio : AVAudioPlayer?
    var count = 0
    
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var messageImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageImg.image = UIImage(named: "defaultMessage")
        prepareBattleAudio()
        prepareCatchAudio()
        prepareWinAudio()
        battleAudio?.play()
        startBlinkAnimation()
    }

    @IBAction func characterTapped(_ sender: Any) {
        if isDefaultImage {
            battleAudio?.stop()
            catchAudio?.stop()
            winAudio?.stop()
            messageImg.image = UIImage(named: "catchMessage")
            catchAudio?.play()
            
        } else {
            performSegue(withIdentifier: "showdex", sender: self)
            messageImg.image = UIImage(named: "defaultMessage")
        }
        isDefaultImage.toggle()
    }
    
    private func startBlinkAnimation() {
            count = 0
            blinkAnimation()
        }
        
    private func blinkAnimation() {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.autoreverse], animations: {
            self.blackView.alpha = 0.0
        }) { _ in
            self.blackView.alpha = 1.0
            self.count += 1
            if self.count < 8 {
                self.blinkAnimation()
            } else {
                self.stopBlinkAnimation()
            }
        }
    }
        
    private func stopBlinkAnimation() {
        self.blackView.removeFromSuperview()
    }
    
    private func prepareBattleAudio() {
        if let audioPath = Bundle.main.path(forResource: "battlePokemon", ofType: "mp3") {
            let audioUrl = URL(fileURLWithPath: audioPath)
            do {
                battleAudio = try AVAudioPlayer(contentsOf: audioUrl)
                battleAudio?.prepareToPlay()
            } catch {
                print("Error loading audio file: \(error)")
            }
        } else {
            print("Audio file not found")
        }
    }
    
    private func prepareCatchAudio() {
        if let audioPath = Bundle.main.path(forResource: "catchPokemon", ofType: "mp3") {
            let audioUrl = URL(fileURLWithPath: audioPath)
            do {
                catchAudio = try AVAudioPlayer(contentsOf: audioUrl)
                catchAudio?.delegate = self
                catchAudio?.prepareToPlay()
            } catch {
                print("Error loading audio file: \(error)")
            }
        } else {
            print("Audio file not found")
        }
    }
    
    private func prepareWinAudio() {
        if let audioPath = Bundle.main.path(forResource: "winPokemon", ofType: "mp3") {
            let audioUrl = URL(fileURLWithPath: audioPath)
            do {
                winAudio = try AVAudioPlayer(contentsOf: audioUrl)
                winAudio?.delegate = self
                winAudio?.prepareToPlay()
            } catch {
                print("Error loading audio file: \(error)")
            }
        } else {
            print("Audio file not found")
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if player == catchAudio {
            winAudio?.play()
        }
    }

}
