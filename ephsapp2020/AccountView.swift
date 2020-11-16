//
//  AccountView.swift
//  EPHS App
//
//  Created by 90305189 on 11/2/20.
//

import SwiftUI

struct AccountView: View {
    @ObservedObject var viewRouter: ViewRouter
    var body: some View {
        VStack {
            Text("Account")
                .font(.title)
            Image("account")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                .padding(.bottom, 20)
            Text("(Name)")
                .foregroundColor(Color.gray)
                .padding(.bottom, 10)
            Text("(School Id)")
                .foregroundColor(Color.gray)
                .padding(.bottom, 20)
            Button(action: {
                viewRouter.currentPage = "login"
            }, label: {
                Text("Log out")
            })
            Spacer()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(viewRouter: ViewRouter())
    }
}
