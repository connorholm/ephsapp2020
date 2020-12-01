//
//  AnnouncementsView.swift
//  EPHS App
//
//  Created by 90305863 on 10/20/20.
//


import SwiftUI

struct AnnouncementsView: View {
    
    @ObservedObject var refresh = Refresh()
    
    var body: some View {
        VStack {
            Text("Announcemts").font(.title)
            
            Button(action: {
                refresh.refresh()
            }, label: {
                Text("Refresh")
            })
            
            Button(action: {
                refresh.inbox.message[0].last_updated += 1
                print("Increased last_updated by 1")
            }, label: {
                Text("Increase last_updated by 1")
            })
            
            ForEach(0..<messages.count){ index in
                MessageDisplay(message: messages[index])
            }
        }
    Spacer()
    }
}

struct MessageDisplay: View {
    var message: Message
    var body: some View {
        VStack {
            Text("\(message.subject)")
            Text("Last updated \(message.last_updated)")
        }.foregroundColor(.white)
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        .padding(5)
        .background(Color.red)
        .cornerRadius(35)
        .shadow(radius: 5)
    }
}


struct AnnouncementsView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementsView(/*inbox: Inbox(message: [Message(id: 0, subject: "0", recipient_ids: "0", last_updated: 0/*, mid: "0"*/, author_id: 0, message_status: "0"/*, message: "0"*/, links: MessageLinks(self: "0"))], links: MessageLinks(self: "0"), unread_count: "0")*/)
            .padding()
    }
}
