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
    
    let startMinute = str.index(str.startIndex, offsetBy: 2)
    let endMinute = str.index(str.endIndex, offsetBy: -6)
    let rangeMinute = startMinute..<endMinute
    
    let startHour = str.index(str.startIndex, offsetBy: 0)
    let endHour = str.index(str.endIndex, offsetBy: -9)
    let rangeHour = startHour..<endHour
    
    let second = Int(String(str[range])) ?? 0
    let minute = Int(String(str[rangeMinute])) ?? 0
    let Hour = Int(String(str[rangeHour])) ?? 0
    
    let currentTime = (Hour * 3600)+(minute * 60)+second
    
    switch timeType {
    case "minute":
        return Int(minute)
    case "second":
        return Int(second)
    case "hour":
        return Int(Hour)
    case "current":
        return currentTime
    default:
        return -1
    }
}
func getAMPM() -> String{
    let now = Date()
   
    let formatter = DateFormatter()
    formatter.dateStyle = .none
    formatter.timeStyle = .medium
    
    
    let mediumTime = formatter.string(from: now)
    
    let start = mediumTime.index(mediumTime.startIndex, offsetBy: 8)
    let ends = mediumTime.index(mediumTime.endIndex, offsetBy: 0)
    let range = start..<ends
    let timeOfDay = String(mediumTime[range])
    
    return timeOfDay
}
func getHour() -> Int {
    let currentTime = getTime(timeType: "current")
    if (getAMPM() == "PM" && currentTime > ((14*3600)+(35*60))) || (getAMPM() == "AM" && currentTime < (8*3600)){
        return -1
    }
    if currentTime > (8*3600) && currentTime < ((9*3600)+(20*60)){
        return 1
    }else if currentTime > ((9*3600)+(35*60)) && currentTime < (11*3600){
        return 2
    }else if currentTime > ((11*3600)+(12*60)) && currentTime < ((12*3600)+(35*60)){
        return 3
    }else if currentTime > ((13*3600)+(15*60)) && currentTime < ((14*3600)+(35*60)){
        return 4
    }
    else{
        return -1
    }
    
}
