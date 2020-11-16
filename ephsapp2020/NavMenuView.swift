//
//  NavMenuView.swift
//  EPHS App
//
//  Created by 90305863 on 10/29/20.
//

import SwiftUI

struct NavMenuView: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        HStack {
            Button(action: {viewRouter.homePage = "assignments"}) {
                Image("assignments")
                    .resizable()
                    .frame(width: 60, height: 60)
            }
            Button(action: {viewRouter.homePage = "announcements"}) {
                Image("announcements")
                    .resizable()
                    .frame(width: 60, height: 60)
            }
            Button(action: {viewRouter.homePage = "menu"}) {
                Image("menu")
                    .resizable()
                    .frame(width: 60, height: 60)
            }
            Button(action: {viewRouter.homePage = "clubs"}) {
                Image("clubs")
                    .resizable()
                    .frame(width: 60, height: 60)
            
            }
            Button(action: {viewRouter.homePage = "account"}) {
                Image("account")
                    .resizable()
                    .frame(width: 60, height: 60)
            }
        }
        .padding()
        .frame(minWidth: 0, maxWidth: 350, minHeight: 0, maxHeight: 50, alignment: .center)
        .border(Color.black, width: 1)
    }
}

struct NavMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavMenuView(viewRouter: ViewRouter())
    }
}
