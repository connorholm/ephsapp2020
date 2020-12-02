//
//  MotherView.swift
//  ThreeCards
//
//  Created by 90305863 on 9/11/20.
//  Copyright © 2020 90305863. All rights reserved.
//

import SwiftUI


struct MotherView: View {
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var refresh: Refresh
    
    var keys = ["", ""]
    
    var body: some View {
        VStack {
            switch viewRouter.currentPage {
                case "tutorial":
                    TutorialView(viewRouter: viewRouter)
                case "home":
                    HomeView(viewRouter: viewRouter, refresh: refresh)
                default:
                    LoginView(viewRouter: viewRouter, refresh: refresh)
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter(), refresh: Refresh())
    }
}
