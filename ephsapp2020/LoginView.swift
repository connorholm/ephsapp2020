//
//  ContentView.swift
//  EPHS App
//
//  Created by 90305863 on 9/30/20.
//


import SwiftUI

var isGuest = false

struct LoginView: View {
    @ObservedObject var viewRouter: ViewRouter
    var api: API
    @State var defaults = UserDefaults.standard
    let keys = Keys()
    
    @State var consumer_key: String = ""
    @State var consumer_secret: String = ""
    
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    
    var body: some View {
        VStack {
            Image("ephs")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 75)
            
            Text("Copy and paste login information from link below; you must only do this once")
                .foregroundColor(.red)
            Link("Click Here for Login Info", destination: URL(string: "https://edenpr.schoology.com/api")!)
            
            SchoolidTextField(schoolid: $consumer_key)
            PasswordSecureField(password: $consumer_secret)
            if authenticationDidFail {
                Text("Information not correct. Try again.")
                    .offset(y: -10)
                    .foregroundColor(.red)
                    .animation(Animation.default)
            }
            
            Button(action: {
                // Sends keys to viewRouter WITHOUT VERIFICATION
                if consumer_key.count == 41 && consumer_secret.count == 32 {
                    defaults.set(consumer_key, forKey: keys.consumer_key)
                    defaults.set(consumer_secret, forKey: keys.consumer_secret)
                    api.refresh()
                    viewRouter.currentPage = "tutorial"
                } else {
                    authenticationDidFail = true
                }
                isGuest = false
                defaults.set(isGuest, forKey: keys.isGuestVar)
            }) {
                BigRedText(text: "Login")
            }
            
            Button(action: {
                viewRouter.currentPage = "tutorial"
                isGuest = true
                defaults.set(isGuest, forKey: keys.isGuestVar)

            }) {
                BigRedText(text: "Guest login")
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewRouter: ViewRouter(), api: API(), defaults: UserDefaults())
    }
}

struct SchoolidTextField: View {
    
    @Binding var schoolid: String
    
    var body: some View {
        TextField("Consumer key", text: $schoolid)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct PasswordSecureField: View {
    
    @Binding var password: String
    
    var body: some View {
        SecureField("Consumer secret", text: $password)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(5.0)
            .padding(.bottom, 25)
    }
}
