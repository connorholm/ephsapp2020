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
                .font(.title)
            Image("account")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150, alignment: .center)
                .padding(.bottom, 20)
            if isGuest {
                Text("You are a guest")
                    .padding(.bottom, 10)
                    .font(.title2)
                Text("Assignments, Announcements, Clubs disabled")
                    .font(.caption)
            } else {
                Text("(Name)")
                    .foregroundColor(Color.gray)
                    .padding(.bottom, 10)
                Text("(School ID)")
                    .foregroundColor(Color.gray)
                    .padding(.bottom, 20)
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
