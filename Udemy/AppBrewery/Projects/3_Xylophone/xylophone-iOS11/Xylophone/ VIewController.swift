//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        
//        let url = Bundle.main.url(forResource: "note1", withExtension: "wav")!
//
//        do {
//            player = try AVAudioPlayer(contentsOf: url)
//            guard let player = player else { return }
//
//            player.prepareToPlay()
//            player.play()
//        } catch let error as Error {
//            print(error.localizedDescription)
//        }
        /*
        if let soundURL = Bundle.main.url(forResource: "note1", withExtension: "wav") {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
            // Play
            AudioServicesPlaySystemSound(mySound)
        }
        print("\(sender.tag)")*/
        
        let soundURL = Bundle.main.url(forResource: "note1", withExtension: "wav")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        
        audioPlayer.play()
    }
    
  

}

