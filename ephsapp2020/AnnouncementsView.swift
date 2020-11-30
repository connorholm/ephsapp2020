//
//  AnnouncementsView.swift
//  EPHS App
//
//  Created by 90305863 on 10/20/20.
//


import SwiftUI
import Combine

class Refresh: ObservableObject {
    let objectWillChange = PassthroughSubject<Refresh,Never>()
    var inbox: Inbox = RequestInbox() {
        didSet {
            objectWillChange.send(self)
            print("Inbox refreshed")
        }
    }
}

struct AnnouncementsView: View {
    
    var refresh = Refresh()
    
    var body: some View {
        VStack {
            Text("Announcemts").font(.title)
            
            Button(action: {}, label: {
                Text("Refresh")
            })
            Button(action: {
                refresh.inbox.message[0].author_id += 1
                print("Increased author_id by 1")
            }, label: {
                Text("Increase author id by 1")
            })
            Text("Last Updated: \(refresh.inbox.message[0].last_updated)")
                .foregroundColor(.white)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(5)
                .background(Color.red)
                .cornerRadius(35)
                .shadow(radius: 5)
            Text("Subject: \(refresh.inbox.message[0].subject)")
                .foregroundColor(.white)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(5)
                .background(Color.red)
                .cornerRadius(35)
                .shadow(radius: 5)
            
            Spacer()
        }
    }
}

struct AnnouncementsView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementsView(/*inbox: Inbox(message: [Message(id: 0, subject: "0", recipient_ids: "0", last_updated: 0/*, mid: "0"*/, author_id: 0, message_status: "0"/*, message: "0"*/, links: MessageLinks(self: "0"))], links: MessageLinks(self: "0"), unread_count: "0")*/)
            .padding()
    }
}
