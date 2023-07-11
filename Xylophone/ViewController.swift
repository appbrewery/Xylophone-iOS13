//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    // A property to store the audio player
    var audioPlayer: AVAudioPlayer?
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        sender.layer.shouldRasterize = true
        sender.layer.rasterizationScale = UIScreen.main.scale
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut) {
            sender.alpha = 0.5
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut) {
                sender.alpha = 1.0
            }
            sender.layer.shouldRasterize = false
        }
        playSound(fileName: sender.currentTitle!)
    }
    
    // A function that takes a sound file name as a parameter and plays the sound using AVAudioPlayer
    func playSound(fileName: String) {
      // Load the sound file from the app bundle with extension "wav"
      if let soundURL = Bundle.main.url(forResource: fileName, withExtension: "wav") {
        do {
          // Initialize the audio player with the sound file URL
          audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
          // Set the delegate to self if you want to implement any of the AVAudioPlayerDelegate methods
          audioPlayer?.delegate = self
          // Prepare to play
          audioPlayer?.prepareToPlay()
          // Play the sound
          audioPlayer?.play()
        } catch {
          // Handle any errors
          print(error.localizedDescription)
        }
      }
    }

    

}

