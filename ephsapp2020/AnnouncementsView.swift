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
        VStack(alignment: .leading) {
            Text(shortTitle(title: message.subject))
            Text("Last updated \(dateConversion(unixTime: message.last_updated))").font(.caption)
        }.frame(idealWidth: .infinity)
    }
}

func dateConversion(unixTime: Int) -> String {
    let df = DateFormatter()
    df.dateFormat = "h:mm M/d/yy"
    return df.string(from: NSDate(timeIntervalSince1970: TimeInterval(unixTime)) as Date)
}

func shortTitle(title: String) -> String {
    var new = ""
    var section = 0
    for char in title {
        switch section {
        case 0:
            if char != "[" {
                new += String(char)
                if char == ":" {
                    section = 1
                }
            }
        case 1:
            if char == "]" {
                section = 2
            }
        default:
            new += String(char)
        }
    }
    return new
}


struct AnnouncementsView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementsView(inbox: Inbox(message: [Message](), links: links, unread_count: ""))
            .padding()
    }
}
