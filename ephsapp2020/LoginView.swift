//
//  ContentView.swift
//  EPHS App
//
//  Created by 90305863 on 9/30/20.
//

import SwiftUI

// MESSAGE: This is where we can use Schoology API for SchoolIDs and passwords
let storedSchoolID = "0"
let storedPassword = "0"
//

struct LoginView: View {
    @ObservedObject var viewRouter: ViewRouter
    
    @State var schoolid: String = ""
    @State var password: String = ""
    
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    
    var body: some View {
        
        ZStack {
            VStack {
                Image("ephs")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 75)
                
                SchoolidTextField(schoolid: $schoolid)
                PasswordSecureField(password: $password)
                if authenticationDidFail {
                    Text("Information not correct. Try again.")
                        .offset(y: -10)
                        .foregroundColor(.red)
                        .animation(Animation.default)
                }
                
                
                Button(action: {
                    if self.schoolid == storedSchoolID && self.password == storedPassword {
                        self.authenticationDidSucceed = true
                    } else {
                        self.authenticationDidFail = true
                    }
                    
                    if authenticationDidSucceed {
                        viewRouter.currentPage = "tutorial"
                    }
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
        LoginView(viewRouter: ViewRouter())
    }
}

struct SchoolidTextField: View {
    
    @Binding var schoolid: String
    
    var body: some View {
        TextField("School ID", text: $schoolid)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct PasswordSecureField: View {
    
    @Binding var password: String
    
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(5.0)
            .padding(.bottom, 25)
    }
}
