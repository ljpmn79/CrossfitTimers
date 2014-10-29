//
//  Stopwatch.swift
//  CrossfitTimers
//
//  Created by Luciano Patino on 9/29/14.
//  Copyright (c) 2014 Luciano Patino. All rights reserved.
//

import UIKit

class Stopwatch: UIViewController {

    @IBOutlet weak var btnStop: UIButton!
    @IBOutlet weak var lblTimer: UILabel!
    var isPaused:Bool = true
    var myTimer = NSTimer()
    var totalSeconds:Int32 = -10
    var stopButtonTitle = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblTimer.text = "00:00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startTimer(sender: AnyObject) {
        if (isPaused) {
            isPaused = false
            stopButtonTitle = "Stop"
            btnStop.setTitle(stopButtonTitle, forState: .Normal)
            myTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTimerLabel", userInfo: nil, repeats: true)

        }
    }

    @IBAction func stopTimer(sender: AnyObject) {
        isPaused = true
        
        switch (stopButtonTitle){
        case "Stop":
            stopButtonTitle = "Reset"
            btnStop.setTitle(stopButtonTitle, forState: .Normal)
            myTimer.invalidate()
            break
        case "Reset":
            totalSeconds = -10
            lblTimer.text = "00:00"
            stopButtonTitle = "Stop"
            btnStop.setTitle(stopButtonTitle, forState: .Normal)
        default:
        break
        }
    }
    
    func updateTimerLabel() {
            totalSeconds += 1
            lblTimer.text = formatTime(totalSeconds)
    }
    
 }
