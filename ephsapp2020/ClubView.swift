//
//  ClubView.swift
//  EPHS App
//
//  Created by 90305189 on 11/2/20.
//


import SwiftUI
import Combine

struct ClubView: View {
    @ObservedObject var clubPage = ClubPage()
    var body: some View {
        switch clubPage.clubPage {
        case "moreClubs":
            WebViews(url: "https://www.edenpr.org/eden-prairie-high-school/activitiesathletics/co-curricular-clubs")
        default:
            Clubs(clubPage: clubPage)
        }
    }
}

struct Clubs: View {
    @ObservedObject var clubPage: ClubPage
    var body: some View {
        VStack {
            Text("Clubs")
                .font(.title)
                .padding()
            List {
                DisclosureGroup("Key Club"){
                    ScrollView{
                        VStack {
                            DisclosureGroup("Announcement1"){
                                Text("Hello World")
                            }
                            .font(.title3)
                            .padding()
                            .cornerRadius(35)
        
                            DisclosureGroup("Announcement2"){
                                Text("Hello World")
                            }
                            .font(.title3)
                            .padding()
                            .cornerRadius(35)
        
                            DisclosureGroup("Announcement3"){
                                Text("Hello World")
                            }
                            .font(.title3)
                            .padding()
                            .cornerRadius(35)
                        }
                    }.frame(height : 150)
        
                }.font(.title2)
                .padding()
                .cornerRadius(35)
        
                DisclosureGroup("Key Club"){
                    ScrollView{
                        VStack {
                            DisclosureGroup("Announcement1"){
                                Text("Hello World")
                            }
                            .font(.title3)
                            .padding()
                            .cornerRadius(35)
        
                            DisclosureGroup("Announcement2"){
                                Text("Hello World")
                            }
                            .font(.title3)
                            .padding()
                            .cornerRadius(35)
        
                            DisclosureGroup("Announcement3"){
                                Text("Hello World")
                            }
                            .font(.title3)
                            .padding()
                            .cornerRadius(35)
                        }
                    }.frame(height : 150)
        
                }.font(.title2)
                .padding()
                .cornerRadius(35)
        
                DisclosureGroup("Key Club"){
                    ScrollView{
                        VStack {
                            DisclosureGroup("Announcement1"){
                                Text("Hello World")
                            }
                            .font(.title3)
                            .padding()
                            .cornerRadius(35)
        
                            DisclosureGroup("Announcement2"){
                                Text("Hello World")
                            }
                            .font(.title3)
                            .padding()
                            .cornerRadius(35)
        
                            DisclosureGroup("Announcement3"){
                                Text("Hello World")
                            }
                            .font(.title3)
                            .padding()
                            .cornerRadius(35)
                        }
                    }.frame(height : 150)
        
                }.font(.title2)
                .padding()
                .cornerRadius(35)
            }
//            .frame(height: 200)
            
            Button(action: {clubPage.clubPage = "moreClubs"} ) {
                Text("More about Clubs")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width:350, height: 60)
                    .background(Color.red)
                    .cornerRadius(35)
                    .padding()
            }
            Spacer()
        }
    }
}

class ClubPage: ObservableObject {
    let objectWillChange = PassthroughSubject<ClubPage,Never>()
    var clubPage: String = "clubs" {
        didSet {
            objectWillChange.send(self)
        }
    }
}

struct ClubView_Previews: PreviewProvider {
    static var previews: some View {
        ClubView()
            .padding()
    }
}



