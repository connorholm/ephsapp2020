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
                .frame(width: 150, height: 150, alignment: .center)
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
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 200, height: 60)
                    .background(Color.red)
                    .cornerRadius(35)
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
