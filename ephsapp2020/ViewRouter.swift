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
    var currentPage: String = "login" {
        didSet {
            objectWillChange.send(self)
        }
    }
    var homePage: String = "assignments" {
        didSet {
            objectWillChange.send(self)
        }
    }
}
