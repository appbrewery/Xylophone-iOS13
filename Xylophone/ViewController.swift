//
//  ViewController.swift
//  Xylophone
//  //forked  aug.2021
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //All btns connencted to same IBAction function
    @IBAction func keyPressed(_ sender: UIButton) {
      
        playSound(soundName: sender.currentTitle!)
        
        // reduce the opacity to half
        sender.alpha = 0.4
        
        // 0.2 s delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
        // opacity back to normal
        sender.alpha = 1.0
                  }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
            
    }
}
