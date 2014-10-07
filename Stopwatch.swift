//
//  FirstViewController.swift
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
    var totalSeconds = Int32()
    var minutes = Int32()
    var seconds = Int32()
    var hours = Int32()
    var strHours = String()
    var strMinutes = String()
    var strSeconds = String()
    var stopButtonTitle = String()
    var countdown:Bool = true
    var countdownSeconds:Int32 = 10
    
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
            totalSeconds = 0
            lblTimer.text = "00:00"
            stopButtonTitle = "Stop"
            countdown = true
            countdownSeconds = 10
            btnStop.setTitle(stopButtonTitle, forState: .Normal)
        default:
        break
        }
    }
    
    func updateTimerLabel() {
        
        if countdown == true && countdownSeconds > 0 {
            countdownSeconds -= 1
            if countdownSeconds < 10 {
                strSeconds = "0\(countdownSeconds)"
            } else {
                strSeconds = "\(countdownSeconds)"
            }
            lblTimer.text = ":" + strSeconds
        } else if countdown == true && countdownSeconds == 0 {
            countdown = false
            totalSeconds = 1
            lblTimer.text = ":01"
        } else {
            totalSeconds += 1
            seconds = totalSeconds % 60
            minutes = (totalSeconds / 60) % 60
            hours = totalSeconds / 3600
            
            if hours == 0 && minutes == 0 {
                
                if seconds < 10 {
                    strSeconds = "0\(seconds)"
                } else {
                    strSeconds = "\(seconds)"
                }
                
                lblTimer.text = ":" + strSeconds
                
            } else if hours == 0 {
                strMinutes = "\(minutes)"
                
                if seconds < 10 {
                    strSeconds = "0\(seconds)"
                } else {
                    strSeconds = "\(seconds)"
                }
                
                lblTimer.text = strMinutes + ":" + strSeconds
                
            } else {
                strHours = "\(hours)"
                if minutes < 10 {
                    strMinutes = "0\(minutes)"
                } else {
                    strMinutes = "\(minutes)"
                }
                if seconds < 10 {
                    strSeconds = "0\(seconds)"
                } else {
                    strSeconds = "\(seconds)"
                }
                
                lblTimer.text = strHours + ":" + strMinutes + ":" + strSeconds
                
            }
        }
 
        
        

        
    }

}
