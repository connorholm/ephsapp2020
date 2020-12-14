//
//  AccountView.swift
//  EPHS App
//
//  Created by 90305189 on 11/2/20.
//


import SwiftUI

struct AccountView: View {
    @ObservedObject var viewRouter: ViewRouter
    @State var defaults = UserDefaults.standard
    let keys = Keys()
    
    var body: some View {
        VStack {
            Text("Account")
                .font(.largeTitle)
            Image("account")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100, alignment: .center)
                .padding(.bottom, 20)
            if isGuest {
                Text("You are a guest")
                    .padding(.bottom, 10)
                    .font(.title2)
//                Text("Assignments, Announcements, Clubs disabled")
//                    .font(.title3)
                Text("Assignments, Announcements, Grades disabled")
                    .font(.callout)
            }
            Button(action: {
                defaults.set("login", forKey: keys.currentPage)
                viewRouter.currentPage = "login"
            }, label: {
                BigRedText(text: "Change API Keys")
            })
            Button(action: {
                defaults.set("tutorial", forKey: keys.currentPage)
                viewRouter.currentPage = "tutorial"
            }, label: {
                BigRedText(text: "View Tutorial")
            })
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(viewRouter: ViewRouter())
    }
}
