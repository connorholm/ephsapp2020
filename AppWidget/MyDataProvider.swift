//
//  MyDataProvider.swift
//  ephsapp2020
//
//  Created by Rachel Ansley Park on 1/5/21.
//

import Foundation

class MyDataProvider {
    static func getRandomString() -> String {
        let currentClassHour = getHour()
        var hr: String = ""
        if currentClassHour == 1{
            hr = "1st Hour"
        }else if currentClassHour == 2{
            hr = "2nd Hour"
        }else if currentClassHour == 3{
            hr = "3rd Hour"
        }else if currentClassHour == 4{
            hr = "4th Hour"
        }else if currentClassHour == -1{
            hr = "Class Hasn't Started Yet"
        }
        
        return hr
    }
}

// Date.swift
//To return this method use the parameter minute/second/hour/current
func getDate(timeType: String) -> String {
    let day = Date()
    
    let dayFormatter = DateFormatter()
    dayFormatter.dateStyle = .full
    dayFormatter.timeStyle = .none
    
    let date = dayFormatter.string(from: day)
    
    let index = date.index(date.startIndex, offsetBy: 4)
    let dateSubstring = date[..<index]
    
    if timeType == "day" {
        //return String(dateSubstring)
        return "Frid"
    }
    else{
        return "ERROR"
    }
}

// time.swift
//To return this method use the parameter minute/second/hour/current
func getTime(timeType: String) -> Int {
    let date = Date()
    var calendar = Calendar.current

    let Hour = calendar.component(.hour, from: date)
    let minute = calendar.component(.minute, from: date)
    let second = calendar.component(.second, from: date)

    print("\(Hour):\(minute):\(second)")
    
    
    
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
    if currentTime > (8*3600) && currentTime < ((9*3600)+(20*60)) && getDate(timeType: "day") != "Frid"{
        return 1
    }else if currentTime > ((9*3600)+(35*60)) && currentTime < (11*3600)  && getDate(timeType: "day") != "Frid"{
        return 2
    }else if currentTime > ((11*3600)+(12*60)) && currentTime < ((12*3600)+(35*60))  && getDate(timeType: "day") != "Frid"{
        return 3
    }else if currentTime > ((13*3600)+(15*60)) && currentTime < ((14*3600)+(35*60))  && getDate(timeType: "day") != "Frid"{
        return 4
    }else if getDate(timeType: "day") == "Frid" &&  currentTime > Int(firstHrStartTime()) && currentTime < Int(firstHrStartTime() + getClassLength()){
        return 1
    }
    else if getDate(timeType: "day") == "Frid" &&  currentTime > Int(secondHrStartTime()) && currentTime < Int(secondHrStartTime() + getClassLength()){
        return 2
    }
    else if getDate(timeType: "day") == "Frid" &&  currentTime > Int(thirdHrStartTime()) && currentTime < Int(thirdHrStartTime() + getClassLength()){
        return 3
    }else if getDate(timeType: "day") == "Frid" &&  currentTime > Int(fourthHrStartTime()) && currentTime < Int(fourthHrStartTime() + getClassLength()){
        return 4
    }
    else{
        return -1
    }
    
}

// ClassTime.swift
func getClassLength() -> Float{
    var classLength = 0
    var totalLength = 0
    if getDate(timeType: "day") == "Frid"{
        classLength = 45
        totalLength = classLength * 60
    }
    else{
        classLength = 80
        totalLength = classLength*60
    }
    return Float(totalLength)
}
func firstHrStartTime() -> Float{
    var startTime = 0
    if getDate(timeType: "day") == "Frid"{
        startTime = (8*3600) + (0*60)
    }else{
        startTime = (8*3600) + (0*60)
    }
    return Float(startTime)
}
func secondHrStartTime() -> Float{
    var startTime = 0
    if getDate(timeType: "day") == "Frid"{
        startTime = (8*3600) + (55*60)
    }else{
        startTime = (9*3600) + (35*60)
    }
    return Float(startTime)
}
func thirdHrStartTime() -> Float{
    var startTime = 0
    if getDate(timeType: "day") == "Frid"{
        startTime = (9*3600) + (55*60)
    }else{
        startTime = (11*3600) + (15*60)
    }
    return Float(startTime)
}
func fourthHrStartTime() -> Float{
    var startTime = 0
    if getDate(timeType: "day") == "Frid"{
        startTime = (10*3600) + (45*60)
    }else{
        startTime = (13*3600) + (15*60)
    }
    return Float(startTime)
}
