//
//  AnnouncementsView.swift
//  EPHS App
//
//  Created by 90305863 on 10/20/20.
//


import SwiftUI

struct AnnouncementsView: View {
    var inbox: Inbox
    @State var defaults = UserDefaults.standard
    let keys = Keys()
    
    var body: some View {
        VStack {
            Text("Announcements").font(.title)
            
            List {
                ForEach(0..<inbox.message.count){ index in
                    MessageDisplay(message: inbox.message[index])
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
        AnnouncementsView(inbox: Inbox(message: [Message](), links: links, unread_count: ""))
            .padding()
    }
}
