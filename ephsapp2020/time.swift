//
//  time.swift
//  EPHS App
//
//  Created by 90305163 on 10/28/20.
//

import Foundation
//To return this method use the parameter minute/second/hour/current
func getTime(timeType: String) -> Int {
    let now = Date()

    let formatter = DateFormatter()
    formatter.dateStyle = .none
    formatter.timeStyle = .medium
    
    let str = formatter.string(from: now)
    
    let start = str.index(str.startIndex, offsetBy: 6)
    let end = str.index(str.endIndex, offsetBy: -3)
    let range = start..<end
    
    let startMinute = str.index(str.startIndex, offsetBy: 3)
    let endMinute = str.index(str.endIndex, offsetBy: -6)
    let rangeMinute = startMinute..<endMinute
    
    let startHour = str.index(str.startIndex, offsetBy: 0)
    let endHour = str.index(str.endIndex, offsetBy: -9)
    let rangeHour = startHour..<endHour
    
    let second = Int(String(str[range])) ?? 0
    let minute = Int(String(str[rangeMinute])) ?? 0
    let Hour = Int(String(str[rangeHour])) ?? 0
    
    let currentTime = (Hour * 3600)+(minute * 60)+second
    
    if timeType == "minute" {
        return Int(minute) 
    }
    else if timeType == "second" {
        return Int(second) 
    }
    else if timeType == "hour" {
        return Int(Hour) 
    }
    else if timeType == "current" {
        return currentTime
    }
    else{
        return -1
    }
}
