//
//  ClassTime.swift
//  ephsapp2020
//
//  Created by 90305163 on 12/11/20.
//

import Foundation



func getClassLength() -> Float{
    var classLength = 0
    var totalLength = 0
    if getDate(timeType: "day") == "frid"{
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


