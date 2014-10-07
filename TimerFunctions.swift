//
//  TimerFunctions.swift
//  CrossfitTimers
//
//  Created by Luciano Patino on 10/6/14.
//  Copyright (c) 2014 Luciano Patino. All rights reserved.
//

import Foundation

func formatTime(time:Int32) -> String{
        
        var seconds:Int32 = time % 60
        var minutes:Int32 = (time / 60) % 60
        var hours:Int32 = time / 3600
        var timerLabel = String()
        
        if hours > 0 {
            timerLabel  = "\(hours)" + ":" + String(format: "%02d", minutes)
        } else {
            timerLabel = "\(minutes)"
        }
        
        timerLabel += ":" + String(format: "%02d", seconds)
    
        return timerLabel
    }
