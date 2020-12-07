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
    var api = API()
    @State var defaults = UserDefaults.standard
    let keys = Keys()
    
    init() {
        api.getInbox()
    }
    
    var body: some View {
        VStack {
            if defaults.string(forKey: keys.currentPage) == "home" {
                HomeView(viewRouter: viewRouter, api: api)
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
    let consumer_key = "consumerKeyString"
    let consumer_secret = "consumerSecretString"
    let user_id = "userIDString"
    let currentPage = "currentPageString"
}
