//
//  SecondViewController.swift
//  music
//
//  Created by reza on 9/9/18.
//  Copyright © 2018 reza. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func play(_ sender: Any) {
        if audioPlayer.isPlaying == false && audiostuffed == true
        {
            audioPlayer.play()
        }
    }
    @IBAction func pause(_ sender: Any) {
        if audiostuffed == true && audioPlayer.isPlaying
        {
            audioPlayer.pause()
        }
    }
    
    @IBAction func prev(_ sender: Any) {
        if thisSong != 1 && audiostuffed == true
        {
          playThis(thisOne: songs[thisSong-1])
          thisSong -= 1
          label.text = songs[thisSong]
        }
        else
        {
            
        }
    }
    
    @IBAction func next(_ sender: Any) {
        
        if thisSong < songs.count-1 && audiostuffed == true
        {
           playThis(thisOne: songs[thisSong+1])
           thisSong += 1
           label.text = songs[thisSong]
        }
        else
        {
            
        }
    }
    
    @IBAction func slider(_ sender: UISlider) {
        if audiostuffed == true && audiostuffed == true
        {
        audioPlayer.volume=sender.value
        }
    }
    
    func playThis(thisOne: String){
        
        do
        {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
        }
        catch
        {
            print("error")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = songs[thisSong]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

