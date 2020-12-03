//
//  MotherView.swift
//  ThreeCards
//
//  Created by 90305863 on 9/11/20.
//  Copyright © 2020 90305863. All rights reserved.
//

import SwiftUI

struct MotherView: View {
    @ObservedObject var viewRouter = ViewRouter()
    @ObservedObject var inbox = GetInbox()
    @State var defaults = UserDefaults.standard
    let keys = Keys()
    
    var body: some View {
        VStack {
            if defaults.string(forKey: keys.currentPage) == "home" {
                HomeView(viewRouter: viewRouter, inbox: inbox)
            } else if viewRouter.currentPage == "tutorial" {
                TutorialView(viewRouter: viewRouter)
            } else {
                LoginView(viewRouter: viewRouter)
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView()
    }
}

struct Keys {
    var consumer_key: String = "consumerKeyString"
    var consumer_secret: String = "consumerSecretString"
    var currentPage: String = "currentPageString"
}
