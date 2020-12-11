//
//  NavMenuView.swift
//  EPHS App
//
//  Created by 90305863 on 10/29/20.
//


import SwiftUI

struct NavMenuView: View {
    @ObservedObject var viewRouter: ViewRouter
    @State private var refreshAlert = false
    
    var api : API
    var body: some View {
        
        HStack {
            
            Button(action: {
                if !isGuest {
                    viewRouter.homePage = "assignments"
                }
            }) {
                Image("assignments")
                    .resizable()
                    .frame(width: 60, height: 60)
            }
            Button(action: {
                if !isGuest {
                    viewRouter.homePage = "announcements"
                }
            }) {
                Image("announcements")
                    .resizable()
                    .frame(width: 60, height: 60)
            }
            Button(action: {viewRouter.homePage = "menu"}) {
                Image("menu")
                    .resizable()
                    .frame(width: 60, height: 60)
            }
            Button(action: {
                if !isGuest {
                    viewRouter.homePage = "grade"
                }
            }) {
                Image("grade")
                    .resizable()
                    .frame(width: 60, height: 60)
            }
            Button(action: {viewRouter.homePage = "account"}) {
                Image("account")
                    .resizable()
                    .frame(width: 60, height: 60)
            }
            Button(action: {
                api.getInbox()
                refreshAlert = true
            }) {
                Image("refresh")
                    .resizable()
                    .frame(width: 60, height: 60)
            }.alert(isPresented: $refreshAlert, content: {
                Alert(title: Text("Refreshed"), dismissButton: nil)
            })
        }
        .padding()
        .frame(minWidth: 0, maxWidth: 400, minHeight: 0, maxHeight: 50, alignment: .center)
        .border(Color.black, width: 1)
    }
}

struct NavMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavMenuView(viewRouter: ViewRouter(), api: API())
    }
}
