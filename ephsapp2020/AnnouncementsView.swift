//
//  AnnouncementsView.swift
//  EPHS App
//
//  Created by 90305863 on 10/20/20.
//


import SwiftUI

struct AnnouncementsView: View {
    
    var inbox = RequestInbox()
    
    var body: some View {
        VStack {
            Text("Announcemts").font(.title)
            
            Text("author_id: \(inbox.message[0].author_id)")
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
