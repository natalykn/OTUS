//
//  Profiler.swift
//  AppWithWidget
//
//  Created by Natalia Andryushina on 2022-04-17.
//

import Foundation

class Profiler {
    class func runClosureForTime(_ closure: (() -> Void)!) -> TimeInterval {
        //Timestamp before
        let startDate = Date()
        
        //Run the closure
        closure()
        
        //Timestamp after
        let endDate = Date()
        
        //Calculate the interval.
        let interval = endDate.timeIntervalSince(startDate)
        
        return interval
    }
}
