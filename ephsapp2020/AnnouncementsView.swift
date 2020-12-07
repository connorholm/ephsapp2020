//
//  AnnouncementsView.swift
//  EPHS App
//
//  Created by 90305863 on 10/20/20.
//


import SwiftUI

struct AnnouncementsView: View {
    var api: API
    @State var defaults = UserDefaults.standard
    let keys = Keys()
    
    var body: some View {
        VStack {
            Text("Announcements").font(.title)
            
            Button(action: {
                api.getInbox()
            }, label: {
                Text("Refresh")
            })
            List {
                ForEach(0..<api.inbox.message.count){ index in
                    MessageDisplay(message: api.inbox.message[index])
                }
            }
        }
    Spacer()
    }
}

struct MessageDisplay: View {
    var message: Message

    var body: some View {
        VStack {
            Text(message.subject)
            Text("Last updated \(NSDate(timeIntervalSince1970: TimeInterval(message.last_updated)))")
        }
    }
}


struct AnnouncementsView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementsView(api: API())
            .padding()
    }
}
