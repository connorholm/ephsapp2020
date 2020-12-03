//
//  Schoology.swift
//  EPHS App
//
//  Created by 90305863 on 11/12/20.
//

import Foundation
import OAuthSwift
import Combine

class GetInbox: ObservableObject {
    let objectWillChange = PassthroughSubject<GetInbox,Never>()
    let defaults = UserDefaults.standard
    let keys = Keys()
    
    var inbox: Inbox = Inbox(message: [Message(id: 0, subject: "0", recipient_ids: "0", last_updated: 0, author_id: 0, message_status: "0", links: MessageLinks(self: "0"))], links: MessageLinks(self: "0"), unread_count: "0") {
        didSet {
            objectWillChange.send(self)
            print("Inbox refreshed")
        }
    }
    func get() -> Void {
        print("Running InboxRequest()...")
        
        let oauthswift = OAuth1Swift(
            consumerKey:    defaults.string(forKey: keys.consumer_key)!,
            consumerSecret: defaults.string(forKey: keys.consumer_secret)!
        )
        
        // do your HTTP request without authorize
        oauthswift.client.get("https://api.schoology.com/v1/messages/inbox") { result in
            switch result {
            case .success(let response):
                var result: Inbox
                do {
                    result = try JSONDecoder().decode(Inbox.self, from: response.data)
                }
                catch {
                    printf("ERROR during JSON conversion: \(error)")
                    return
                }
                self.inbox = result
                printf("Retrieved and decoded data, stoed in inbox")
            case .failure(let error):
                printf("ERROR: \(error)")
                return
            }
        }
        //Code here will run **before** closure
    }
}

let printf:(String) -> () = {
    print("\t\($0)")
}
