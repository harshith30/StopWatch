//
//  ViewController.swift
//  StopWatch
//
//  Created by Aasare on 23/05/16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var Counter = 0.0
    var Timer = Foundation.Timer()
    var IsPlaying=false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet var playBtn: UIButton!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var pauseBtn: UIButton!
    
    @IBAction func resetButtonDidPress(_ sender: AnyObject) {
        Timer.invalidate()
        Counter = 0
        timeLabel.text = String(Counter)
        IsPlaying = false
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
    }
    @IBAction func pauseButtonDidPress(_ sender: AnyObject) {
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        Timer.invalidate()
        IsPlaying = false
    }
    
    @IBAction func playButtonDidPress(_ sender: AnyObject) {
        if(IsPlaying)
        {
            return
        }
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        Timer = Foundation.Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        IsPlaying = true
        
    }
    func updateTimer()
    {
    Counter = Counter + 0.1
    timeLabel.text = String(format: "%.2f", Counter)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

