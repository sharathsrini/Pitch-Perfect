//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Sharath on 26/09/16.
//  Copyright © 2016 Sharath. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
 
    
    
    @IBOutlet weak var Snail: UIButton!
    @IBOutlet weak var Rabbit: UIButton!
    @IBOutlet weak var Chipmunk: UIButton!
    @IBOutlet weak var Vader: UIButton!
    @IBOutlet weak var Echo: UIButton!
    @IBOutlet weak var Reverb: UIButton!
    @IBOutlet weak var StopButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile : AVAudioFile!
    var audioEngine : AVAudioEngine!
    var audioPlayerNode : AVAudioPlayerNode!
    var stopTimer : Timer!
    
    enum ButtonType: Int  {
        case slow=0, fast, chipmunk, vader, echo, reverb
    }
    
    
    @IBAction func playSoundForButton(_ sender: UIButton)
    {
        print("Play Sound Button Pressed!!")
        switch(ButtonType(rawValue: sender.tag)!){
        case.slow:
            playSound(rate: 0.5)
        case.fast:
            playSound(rate: 1.5)
        case.chipmunk:
            playSound(pitch: 1000)
        case.vader:
            playSound(pitch: -1000)
        case.echo:
            playSound(echo: true)
        case.reverb:
            playSound(reverb: true)
   
        }
        configureUI(.playing)
    
    
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton){
        print("Stop Sound Button Pressed!!")
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PlaySoundsViewController loaded")
        setupAudio()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool ){
    configureUI(.notPlaying)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
   
}
