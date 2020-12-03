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
    @ObservedObject var refresh = Refresh()
    @State var defaults = UserDefaults.standard
    
    var body: some View {
        VStack {
            switch viewRouter.currentPage {
                case "tutorial":
                    TutorialView(viewRouter: viewRouter)
                case "home":
                    HomeView(viewRouter: viewRouter, refresh: refresh, defaults: defaults)
                default:
                    LoginView(viewRouter: viewRouter, defaults: defaults)
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
