//
//  HomeView.swift
//  EPHS App
//
//  Created by 90305863 on 10/20/20.
//


import SwiftUI

struct HomeView: View {
    @ObservedObject var viewRouter: ViewRouter
    var api: API
    @State var defaults = UserDefaults.standard

    var body: some View {
        VStack() {
            switch viewRouter.homePage {
            case "assignments":
                AssignmentsView(cidAssignments: api.cidAssignments)
            case "announcements":
                AnnouncementsView(inbox: api.inbox)
            case "grade":
                ClubView()
            case "menu":
                MenuView()
            case "account":
                AccountView(viewRouter: viewRouter)
            default:
                Text("ERROR: No \(viewRouter.homePage) view")
                    .foregroundColor(Color.red)
                progressView()
            }
            Spacer()
            NavMenuView(viewRouter: viewRouter, api: api)
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView(viewRouter: ViewRouter(), api: API(), defaults: UserDefaults())
        }
    }
}
