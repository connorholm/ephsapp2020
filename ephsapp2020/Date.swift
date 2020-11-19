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
    
    let index = date.index(date.startIndex, offsetBy: 4)
    let dateSubstring = date[..<index]
    
    if timeType == "day" {
        return String(dateSubstring)
    }
    else{
        return "ERROR"
    }
}
