//
//  ClubView.swift
//  EPHS App
//
//  Created by 90305189 on 11/2/20.
//

import SwiftUI

struct ClubView: View {
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
            Spacer()
        }
    }
}

struct ClubView_Previews: PreviewProvider {
    static var previews: some View {
        ClubView()
            .padding()
    }
}
