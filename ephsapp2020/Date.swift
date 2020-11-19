//
//  time.swift
//  EPHS App
//
//  Created by 90305163 on 10/28/20.
//

import Foundation
//To return this method use the parameter minute/second/hour/current
func getDate(timeType: String) -> String {
    let day = Date()
    
    let dayFormatter = DateFormatter()
    dayFormatter.dateStyle = .full
    dayFormatter.timeStyle = .none
    
    let date = dayFormatter.string(from: day)
    
    let start = date.index(date.startIndex, offsetBy: 6)
    let end = date.index(date.endIndex, offsetBy: -3)
    let range = start..<end
    
    let Day = String(date[range])
    if timeType == "day" {
        return Day
    }
    else{
        return "ERROR"
    }
}
