//
//  AnnouncementsView.swift
//  EPHS App
//
//  Created by 90305863 on 10/20/20.
//


import SwiftUI

struct AnnouncementsView: View {
    
    var messages = InboxResponce(responce: Messages(messages: [MessageInfo(id: 6, subject: "A message", recipient_ids: "you", last_updated: 197825, mid: "what's this?", author_id: "Your father", message_status: "read", message: "What's poping home boy")]), unread_count: "4")
    
    var body: some View {
        VStack {
            Text("Announcemts").font(.title)
            Text(InboxRequest())
            Text("Sender: \(messages.responce.messages[0].author_id)")
            Spacer()
        }
    }
}

struct AnnouncementsView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementsView()
            .padding()
        
    }
}
