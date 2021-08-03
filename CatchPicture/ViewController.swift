//
//  ViewController.swift
//  CatchPicture
//
//  Created by Abdussamed on 3.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var hightScoreLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    @IBOutlet weak var img7: UIImageView!
    @IBOutlet weak var img8: UIImageView!
    @IBOutlet weak var img9: UIImageView!
    
    var counterNum = 30
    var scoreNum = 0
    var userDefaults: UserDefaults?
    var timer: Timer?
    var timer2: Timer?
    var highScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userDefaults = UserDefaults.standard
        
        img1.isUserInteractionEnabled = true
        img2.isUserInteractionEnabled = true
        img3.isUserInteractionEnabled = true
        img4.isUserInteractionEnabled = true
        img5.isUserInteractionEnabled = true
        img6.isUserInteractionEnabled = true
        img7.isUserInteractionEnabled = true
        img8.isUserInteractionEnabled = true
        img9.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        img1.addGestureRecognizer(recognizer1)
        img2.addGestureRecognizer(recognizer2)
        img3.addGestureRecognizer(recognizer3)
        img4.addGestureRecognizer(recognizer4)
        img5.addGestureRecognizer(recognizer5)
        img6.addGestureRecognizer(recognizer6)
        img7.addGestureRecognizer(recognizer7)
        img8.addGestureRecognizer(recognizer8)
        img9.addGestureRecognizer(recognizer9)
        
        startGame()
        
        
    }
    
    func startGame() {
        scoreNum = 0
        counterNum = 30
        highScore = userDefaults?.object(forKey: "hightScore") as? Int ?? 0
        
        hightScoreLabel.text = "Hight Score: \(highScore)"
        counterLabel.text = String(counterNum)
        scoreLabel.text = "Score: \(scoreNum)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerHandler), userInfo: nil, repeats: true)
        timer2 = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerHandler2), userInfo: nil, repeats: true)
    }
    
    @objc func increaseScore() {
        scoreNum += 1
        scoreLabel.text = "Score: \(String(scoreNum))"
    }
    
    @objc func timerHandler(){
        counterLabel.text = String(counterNum)
        
        counterNum -= 1
        
        if counterNum < 0 {
            timer?.invalidate()
            timer2?.invalidate()
            
            if highScore < scoreNum {
                userDefaults?.setValue(scoreNum, forKey: "hightScore")
                hightScoreLabel.text = "High Score: \(String(scoreNum))"
            }
            let alert = UIAlertController(title: "Time is over!", message: "Your time is over try again.", preferredStyle: UIAlertController.Style.alert)
            let actionNo = UIAlertAction(title: "Exit", style: UIAlertAction.Style.cancel) { UIAlertAction in
                self.hideImages()
            }
            let actionYes = UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default) { UIAlertAction in
                self.startGame()
            }
            
            alert.addAction(actionNo)
            alert.addAction(actionYes)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func timerHandler2(){
        
        let randomNum = Int.random(in: 1..<10)
        hideImages()
        
        if randomNum == 1 { img1.isHidden = false }
        else if randomNum == 2 { img2.isHidden = false }
        else if randomNum == 3 { img3.isHidden = false }
        else if randomNum == 4 { img4.isHidden = false }
        else if randomNum == 5 { img5.isHidden = false }
        else if randomNum == 6 { img6.isHidden = false }
        else if randomNum == 7 { img7.isHidden = false }
        else if randomNum == 8 { img8.isHidden = false }
        else if randomNum == 9 { img9.isHidden = false }
        
    }
    
    func hideImages(){
        img1.isHidden = true
        img2.isHidden = true
        img3.isHidden = true
        img4.isHidden = true
        img5.isHidden = true
        img6.isHidden = true
        img7.isHidden = true
        img8.isHidden = true
        img9.isHidden = true
    }


}

