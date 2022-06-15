//
//  ViewController.swift
//  produttoreMusica
//
//  Created by user on 15/06/22.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
    var selection : String = ""
    var player : AVAudioPlayer!
    

    @IBAction func sia(_ sender: Any) {
        selection = "sia"
    }
    
    @IBAction func montana(_ sender: Any) {
        selection = "montana"
    }
    
    
    @IBAction func maria(_ sender: Any) {
        selection = "maria"
    }
    
    
    @IBAction func play(_ sender: UIButton) {
        
    
   playSound(nomeMp3: selection)
    }
    
    @IBAction func stop(_ sender: UIButton) {
        player.stop()
    }
    
    func playSound(nomeMp3:String) {
        
        print("#####")
        
        guard let url = Bundle.main.url(forResource: nomeMp3, withExtension: "mp3") else {
            print("RETURNING ")
            return
        }
        
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print("Error was detected")
            print(error.localizedDescription)
        }
    }
    
}



