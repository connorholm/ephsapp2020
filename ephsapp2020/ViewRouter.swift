//
//  ViewRouter.swift
//  EPHS App
//
//  Created by 90305863 on 10/20/20.
//


import Foundation
import Combine
import SwiftUI

class ViewRouter: ObservableObject {
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    //let defaults = UserDefaults.standard
    //let keys = Keys()
    
    var currentPage: String = "login" {
        didSet {
            objectWillChange.send(self)
            print("currentPage refreshed")
        }
    }
    var homePage: String = "" {
        didSet {
            objectWillChange.send(self)
            print("homePage refreshed")
        }
    }
}
