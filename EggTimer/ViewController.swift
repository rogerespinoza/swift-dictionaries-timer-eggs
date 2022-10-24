//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTime = ["Soft": 5, "Medium": 7, "Hard": 12]
    var secondsRemaining = 30
    var eggSecconds = 1
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardless = sender.currentTitle!
        
        secondsRemaining = eggTime[hardless]!
        eggSecconds = secondsRemaining
        
        timer.invalidate()
        progressBar.progress = 0.0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        var progress = Float(secondsRemaining) / Float(eggSecconds)
        if secondsRemaining > 0 {
            progressBar.progress = 1.0 - progress
            secondsRemaining -= 1
        }else{
            timer.invalidate()
            progressBar.progress = 1.0
            titleLabel.text = "Done"
        }
    }
    
    

}
