//
//  RViewController.swift
//  Pitch Perfect
//
//  Created by Sharath on 24/09/16.
//  Copyright © 2016 Sharath. All rights reserved.
//

import UIKit
import AVFoundation

class RViewController: UIViewController, AVAudioRecorderDelegate {


    @IBOutlet weak var label: UILabel!
    var audioRecorder:AVAudioRecorder!
 
   

    @IBAction func record(_ sender: AnyObject) {
        label.text = "Recording"
        
        record.isEnabled = false
        stop.isEnabled = true
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURL(withPathComponents: pathArray)
        
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }
    
    @IBAction func stop(_ sender: AnyObject) {
        label.text = "Get Ready to be Amazed"
        record.isEnabled = true
        stop.isEnabled = false
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        }
    
    @IBOutlet weak var record: UIButton!
    @IBOutlet weak var stop: UIButton!
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        
        if(flag) {
            self.performSegue(withIdentifier: "stopRecord", sender: audioRecorder.url)}
        }
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "stopRecord") {
            let playSoundsVC = segue.destination as!
            PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
 }


