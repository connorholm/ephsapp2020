//
//  AnnouncementsView.swift
//  EPHS App
//
//  Created by 90305863 on 10/20/20.
//


import SwiftUI

struct AnnouncementsView: View {
    @ObservedObject var refresh: Refresh
    @State var defaults: UserDefaults
    let keys = Keys()
    
    var body: some View {
        VStack {
            Text("Announcements").font(.title)
            
            Button(action: {
                refresh.refresh(
                    consumer_key: defaults.string(forKey: keys.consumer_key) ?? "",
                    consumer_secret: defaults.string(forKey: keys.consumer_secret) ?? ""
                )
            }, label: {
                Text("Refresh")
            })
            List {
                ForEach(0..<refresh.inbox.message.count){ index in
                    MessageDisplay(message: refresh.inbox.message[index])
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
        AnnouncementsView(refresh: Refresh(), defaults: UserDefaults())
            .padding()
    }
}
