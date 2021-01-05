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
    @State var addItem: Bool = false
    @State var userAnnouncement: String = ""

    var body: some View {
        VStack {
            HStack{
                Text("Announcements").font(.largeTitle)
                Button(action: {
                    addItem = true
                }) {
                    Text("+")
                        .foregroundColor(.black)
                        .bold()
                        .padding(10)
                        .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.red, lineWidth: 5)
                                )
                }
            }
            if addItem == true{
                //usersItemMenu()
                Text("Add Assignment")
                TextField("Enter Announcement", text: $userAnnouncement)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                Button(action: {
                   addItem = false
                    print(userAnnouncement)
                }) {
                    Text("Add Item")
                }
            }
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
