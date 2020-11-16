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
    
    var body: some View {
        VStack {
            switch viewRouter.currentPage {
                case "tutorial":
                    TutorialView(viewRouter: viewRouter)
                case "home":
                    HomeView(viewRouter: viewRouter)
                default:
                    LoginView(viewRouter: viewRouter)
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}
