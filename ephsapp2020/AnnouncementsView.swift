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
                    consumer_key: defaults.string(forKey: keys.consumer_key)!,
                    consumer_secret: defaults.string(forKey: keys.consumer_secret)!
                )
            }, label: {
                Text("Refresh")
            })
            Button(action: {
                refresh.inbox.message[0].last_updated += 1
                print("Increased last_updated by 1")
            }, label: {
                Text("Increase last_updated by 1")
            })
            ForEach(0..<refresh.inbox.message.count){ index in
                MessageDisplay(message: refresh.inbox.message[index])
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
        AnnouncementsView(refresh: Refresh(), defaults: UserDefaults())
            .padding()
    }
}
