//
//  ContentView.swift
//  EPHS App
//
//  Created by 90305863 on 9/30/20.
//


import SwiftUI

struct LoginView: View {
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var refresh: Refresh
    
    @State var consumer_key: String = ""
    @State var consumer_secret: String = ""
    
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    
    var body: some View {
        
        ZStack {
            VStack {
                Image("ephs")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 75)
                
                Link("API Credentials", destination: URL(string: "https://edenpr.schoology.com/api")!)
                
                SchoolidTextField(schoolid: $consumer_key)
                PasswordSecureField(password: $consumer_secret)
                if authenticationDidFail {
                    Text("Information not correct. Try again.")
                        .offset(y: -10)
                        .foregroundColor(.red)
                        .animation(Animation.default)
                }
                
                
                Button(action: {
                    /*
                    if self.schoolid == storedSchoolID && self.password == storedPassword {
                        self.authenticationDidSucceed = true
                    } else {
                        self.authenticationDidFail = true
                    }

                    if authenticationDidSucceed {
                    viewRouter.currentPage = "tutorial"
                    }
                     */
                    
                    // Sends keys to viewRouter WITHOUT VERIFICATION
                    if consumer_key != "" {
                        refresh.oauthswift.setValue(consumer_key, forKey: "consumerKey")
                    }
                    if consumer_secret != "" {
                        refresh.oauthswift.setValue(consumer_secret, forKey: "consumerSecret")
                    }
                        
                    viewRouter.currentPage = "tutorial"
                }) {
                    Text("Login")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width:228, height: 60)
                        .background(Color.red)
                        .cornerRadius(35)
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewRouter: ViewRouter(), refresh: Refresh())
    }
}

struct SchoolidTextField: View {
    
    @Binding var schoolid: String
    
    var body: some View {
        TextField("Comsuner key", text: $schoolid)
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
